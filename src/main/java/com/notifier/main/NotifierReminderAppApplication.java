package com.notifier.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.notifier.Service")
public class NotifierReminderAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(NotifierReminderAppApplication.class, args);
		
	}

}
