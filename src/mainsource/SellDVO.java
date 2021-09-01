package mainsource;

import java.io.File;
import java.io.Serializable;
import java.time.LocalDate;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter @Setter @RequiredArgsConstructor
public class SellDVO  implements Serializable {
	private static final long serialVersionUID = 7382410727665515038L;
	
	private int sellsr;
	private String sellbrand;
	private String sellkinds;
	private String selldata;
	private int sellinven;
	private int sellprice;
	private File sellinfo;
	private File sellimage;
	private LocalDate sellcreate;
	private Integer bksr;
	private Integer sellusr;


	
}
