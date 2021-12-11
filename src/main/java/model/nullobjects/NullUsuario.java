package model.nullobjects;

import model.Usuario;

public class NullUsuario extends Usuario {

	public static Usuario build() {
		return new NullUsuario();
	}
	
	public NullUsuario() {
		super("", "", false, null, 0, 0.0, null, 0);
	}
	
	public boolean isNull() {
		return true;
	}
	
}