package com.saam.microservices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import com.saam.microservices.model.Estadistica;

@RestController
@RequestMapping("/saamicroservices/estadisticas")
public class EstadisticaController {
	
	@Autowired
	private EstadisticasRepository repository;
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public List<Estadistica> nuevasEstadisticas(@RequestBody List<Estadistica> estadisticas) {
		for(Estadistica estadistica : estadisticas)
			repository.save(estadistica);			
		return estadisticas;
	}
}
