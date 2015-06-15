/**
 * Authors: Szabo Bogdan <szabobogdan@yahoo.com>
 * Date: 6 15, 2015
 * License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
 * Copyright: Public Domain
 */
module testedatom;

public import tested;
import core.time;

/**
	Advanced result writer for atom tesed plugin
*/
class AtomTestResultWriter : TestResultWriter {
	import std.stdio;
	private {
		size_t m_failCount, m_successCount;
		string m_name, m_qualifiedName;
	}

	void finalize()
	{

	}

	void beginTest(string name, string qualified_name)
	{
		writeln("\nID:", qualified_name);
		writeln("NAME:", name);

		m_name = name;
		m_qualifiedName = qualified_name;
		stdout.flush;
	}

	void addScalar(Duration timestamp, string name, double value)
	{
	}

	void endTest(Duration timestamp, Throwable error)
	{
		writeln("DURATION:", timestamp.total!"nsecs");

		if (error) {
			writeln("RESULT:FAIL");
			m_failCount++;
		} else {
			writeln("RESULT:PASS");
			m_successCount++;
		}

		stdout.flush;
	}
}
