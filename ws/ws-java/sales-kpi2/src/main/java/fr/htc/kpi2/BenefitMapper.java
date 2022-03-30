package fr.htc.kpi2;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class BenefitMapper extends Mapper<Object, Text, Text, FloatWritable> {

	private FloatWritable benefitByLine = new FloatWritable();
	private Text yearQuarter = new Text();

	protected void map(Object key, Text csvLine, Context context) throws IOException, InterruptedException {

		String line = csvLine.toString();
		String[] tokens = line.split(";");
		float unitSales = Float.parseFloat(tokens[7]);
		float storeSales = Float.parseFloat(tokens[6]);
		String year = tokens[27];
		String quarter = tokens[31];
		float costSales = Float.parseFloat(tokens[5]);

		benefitByLine.set(unitSales * (storeSales - costSales));
		yearQuarter.set(year + "-" + quarter);

		context.write(yearQuarter, benefitByLine);
	}

}
