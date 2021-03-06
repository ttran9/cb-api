package tran.compbuildbackend.config.email;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import java.util.Properties;

import static tran.compbuildbackend.constants.security.SecurityConstants.*;

@Configuration
@EnableJpaRepositories("tran.compbuildbackend.repositories")
public class CommonBeanConfig {


    @Bean(name = "mailSender")
    public JavaMailSender javaMailService() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost(EMAIL_HOST);
        javaMailSender.setPort(587);
        javaMailSender.setProtocol("smtp");
        javaMailSender.setUsername(EMAIL_SENDER_LOGIN);
        javaMailSender.setPassword(EMAIL_SENDER_PASSWORD);

        Properties mailProperties = new Properties();
        mailProperties.put("mail.smtp.auth", "true");
        mailProperties.put("mail.smtp.starttls.enable", "true");
        mailProperties.put("mail.smtp.debug", "true");
        javaMailSender.setJavaMailProperties(mailProperties);
        return javaMailSender;
    }

    @Bean
    public MessageSource messageSource() {
        final ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("classpath:messages");
        messageSource.setUseCodeAsDefaultMessage(true);
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setCacheSeconds(0);
        return messageSource;
    }
}
