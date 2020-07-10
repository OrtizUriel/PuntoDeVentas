package PuntoVentas.view;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ResourceBundle;

import PuntoVentas.model.ConnectorMySQL;

public class ControllerREGISTROPRODUCT {
	@FXML
	private Button Regresar;
	@FXML
	private Button Guardar;
	@FXML
	private TextField cajatipoProduct;
	@FXML
	private TextField cajaNombre;
	@FXML
	private TextField cajaPrecio;
	@FXML
	private TextField cajaFolio;
	@FXML
	private TextField cajanombreProveedor;
	@FXML
	private TextField CAJAnproductos;
	@FXML
	public void cargarListado() {
		try {
			AnchorPane root2 = (AnchorPane)FXMLLoader.load(getClass().getResource("FXMLPuntoVentasLISTADO.fxml"));
			Scene scene = new Scene (root2);
			Stage primaryLayout = new Stage();
			primaryLayout.setScene(scene);
			primaryLayout.setTitle("FXMLPuntoVentasLISTADO");
			primaryLayout.show();
			Stage nuevaEscena =(Stage) this.Regresar.getScene().getWindow();
			nuevaEscena.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void agregar()throws SQLException{
		Connection cn = ConnectorMySQL.getConnection();
        try {
        	System.out.println("HOLI");
            String sSQLL = "INSERT INTO datosproduct (tipoProduct,nombre,folioProduct,precio,nombreProveedor,Cantidad) VALUES(?,?,?,?,?,?)";
            PreparedStatement stt = cn.prepareStatement(sSQLL);
            stt.setString(1,(cajatipoProduct.getText()));            
            stt.setString(2,cajaNombre.getText());
            stt.setString(3,cajaFolio.getText());
            stt.setFloat(4,Float.parseFloat(cajaPrecio.getText()));
            stt.setString(5,cajanombreProveedor.getText());
            stt.setInt(6 ,Integer.parseInt(CAJAnproductos.getText()));
            stt.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
        cajatipoProduct.clear();
        cajaNombre.clear();
        cajaFolio.clear();
        cajaPrecio.clear();
        cajanombreProveedor.clear();
        CAJAnproductos.clear();
        cargarListado();
    }
	
	@FXML
	private Button Salir;
	@FXML
	public void regresarLogin() {
		try {
			AnchorPane root2 = (AnchorPane)FXMLLoader.load(getClass().getResource("FXMLPuntoVentasLOGIN.fxml"));
			Scene scene = new Scene (root2);
			Stage primaryLayout = new Stage();
			primaryLayout.setScene(scene);
			primaryLayout.setTitle("FXMLPuntoVentasLOGIN");
			primaryLayout.show();
			Stage nuevaEscena =(Stage) this.Salir.getScene().getWindow();
			nuevaEscena.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
