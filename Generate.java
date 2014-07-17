import java.util.Properties;
import java.io.File;
import java.io.IOException;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;

import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.util.Config;

public class Generate {
	public static void main(String[] args){
		Properties props = new Properties();
		props.put("kaptcha.textproducer.char.string", "0123456789");
		props.put("kaptcha.textproducer.font.names", "Courier");
		props.put("kaptcha.image.width", "40");
		props.put("kaptcha.image.height", "40");
		Config config = new Config(props);

		for(int i = 0; i < 10000; i++) {
			Producer prod = config.getProducerImpl();

			// create the text for the image
			String capText = prod.createText();

			// create the image with the text
			BufferedImage bi = prod.createImage(capText);
			try {
				File out = new File("out/" + capText + ".png");
				// write the data out
				ImageIO.write(bi, "png", out);
			} catch(IOException e) {
				System.out.println("well fuck");
			}
		}

		for(int i = 0; i < 100; i++) {
			Producer prod = config.getProducerImpl();

			// create the text for the image
			String capText = prod.createText();

			// create the image with the text
			BufferedImage bi = prod.createImage(capText);
			try {
				File out = new File("test/" + capText + ".png");
				// write the data out
				ImageIO.write(bi, "png", out);
			} catch(IOException e) {
				System.out.println("well fuck");
			}
		}
	}
}