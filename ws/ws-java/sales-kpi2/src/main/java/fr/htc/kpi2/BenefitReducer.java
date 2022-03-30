package fr.htc.kpi2;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class BenefitReducer extends Reducer<Text, FloatWritable, Text, FloatWritable> {
	private FloatWritable benefitByLin = new FloatWritable();

	protected void reduce(Text yearQuarter, Iterable<FloatWritable> benefitByLine, Context context)
			throws IOException, InterruptedException {

		float sum = 0;
		for (FloatWritable be : benefitByLine) {
			sum += be.get();
		}
		benefitByLin.set(sum);
		context.write(yearQuarter, benefitByLin);
	}

}
