package ru.springmvchibernate.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.filter.CharacterEncodingFilter;
import ru.springmvchibernate.config.security.handlers.CustomAuthenticationSuccessHandler;
import ru.springmvchibernate.config.security.service.AuthenticationService;



@Configuration
@ComponentScan("ru.springmvchibernate")
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private CustomAuthenticationSuccessHandler successHandler;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(authenticationService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    /*    CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.authorizeRequests()
              //  .antMatchers("/registration").permitAll()
           //     .antMatchers("/user/**").hasAnyAuthority("User")
                .antMatchers("/admin/**").hasAnyAuthority("Admin")
                .antMatchers("/").hasAnyAuthority("Admin", "User")
                .and().formLogin().loginPage("/login").successHandler(successHandler)
         //       .usernameParameter("username").passwordParameter("password")
         //       .and().exceptionHandling().accessDeniedPage("/access_denied")
         ; */
    }
}
