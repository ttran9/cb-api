package tran.compbuildbackend.controllers.computerbuild;

import javax.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import tran.compbuildbackend.domain.computerbuild.Direction;
import tran.compbuildbackend.payload.computerbuild.ComputerBuildDetailResponse;
import tran.compbuildbackend.services.computerbuild.DirectionService;
import tran.compbuildbackend.validator.MapValidationErrorService;

import static tran.compbuildbackend.constants.computerbuild.ComputerBuildConstants.DIRECTION_DELETE_MESSAGE;
import static tran.compbuildbackend.constants.mapping.MappingConstants.*;

@RestController
@RequestMapping(DIRECTION_API)
public class DirectionController {

    private final DirectionService directionService;
    private final MapValidationErrorService mapValidationErrorService;

    public DirectionController(DirectionService directionService, MapValidationErrorService mapValidationErrorService) {
        this.directionService = directionService;
        this.mapValidationErrorService = mapValidationErrorService;
    }

    @PostMapping(BUILD_IDENTIFIER_PATH_VARIABLE)
    public ResponseEntity<?> createDirection(@Valid @RequestBody Direction direction, BindingResult bindingResult,
                                             @PathVariable String buildIdentifier) {
        mapValidationErrorService.outputCustomError(bindingResult);

        // no errors so create the direction.
        Direction createdDirection = directionService.create(buildIdentifier, direction);

        return new ResponseEntity<>(createdDirection, HttpStatus.CREATED);
    }

    @PatchMapping(INDIVIDUAL_DETAIL)
    public ResponseEntity<?> updateDirection(@Valid @RequestBody Direction newDirection, BindingResult bindingResult,
                                             @PathVariable String uniqueIdentifier) {
        mapValidationErrorService.outputCustomError(bindingResult);

        // no errors so update the direction.
        Direction updatedDirection = directionService.update(newDirection, uniqueIdentifier);
        return new ResponseEntity<>(updatedDirection, HttpStatus.OK);
    }

    @DeleteMapping(INDIVIDUAL_DETAIL)
    public ResponseEntity<?> deleteDirection(@PathVariable String uniqueIdentifier) {
        Direction deletedDirection = directionService.delete(uniqueIdentifier);

        // no errors at this point with deletion so return a success message.
        return new ResponseEntity<>(new ComputerBuildDetailResponse(DIRECTION_DELETE_MESSAGE,
                deletedDirection.getUniqueIdentifier()), HttpStatus.OK);
    }

    @GetMapping(INDIVIDUAL_DETAIL)
    public ResponseEntity<?> getDirectionByIdentifier(@PathVariable String uniqueIdentifier) {
        // get the direction and return its contents in the response.
        Direction direction = directionService.getFromUniqueIdentifier(uniqueIdentifier);

        return new ResponseEntity<>(direction, HttpStatus.OK);
    }

}
