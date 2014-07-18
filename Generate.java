import java.util.Properties;
import java.io.File;
import java.io.IOException;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;

import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.util.Config;

public class Generate {
	public static void write(int num, String outDir) {
		Properties props = new Properties();
		props.put("kaptcha.textproducer.char.string", "0123456789");
		props.put("kaptcha.textproducer.font.names", "Courier");
		props.put("kaptcha.image.width", "200");
		props.put("kaptcha.image.height", "50");
		props.put("kaptcha.noise.color", "104,153,194");
		Config config = new Config(props);

		for(int i = 0; i < num; i++) {
			Producer prod = config.getProducerImpl();

			// create the text for the image
			String capText = prod.createText();

			// create the image with the text
			BufferedImage bi = prod.createImage(capText);
			try {
				File out = new File(outDir + capText + ".png");
				// write the data out
				ImageIO.write(bi, "png", out);
			} catch(IOException e) {
				System.out.println("well fuck");
			}
		}
	}

	public static void main(String[] args){
		Generate.write(1, "out/");
	}
}