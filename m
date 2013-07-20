Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:27744 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754072Ab3GTOTI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 20 Jul 2013 10:19:08 -0400
Received: from merkur.ravnborg.org (unknown [188.228.89.252])
	by smtp.domainteam.dk (Postfix) with ESMTPA id 62924F1A9D
	for <linux-kbuild@vger.kernel.org>; Sat, 20 Jul 2013 16:19:06 +0200 (CEST)
Date: Sat, 20 Jul 2013 16:19:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Kconfig test scripts
Message-ID: <20130720141905.GA10229@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>

Hi all.

Often when I hack on Kconfig I have missed a set of test cases,
that would allow me to verify that I did not introduce any regressions.

I have not anything fancy in my mind and I spent
a little time on the attached today.
The following is obviously missing a lot a features - but this
would allow me to get started adding simple test cases.

The idea is that each test cases consist of a full
Kconfig file and the resulting output.

Anyone have something better than this,
or maybe some brilliant ideas how to do this much better?

	Sam

diff --git a/scripts/kconfig/tests/run.sh b/scripts/kconfig/tests/run.sh
new file mode 100644
index 0000000..fbd7613
--- /dev/null
+++ b/scripts/kconfig/tests/run.sh
@@ -0,0 +1,20 @@
+# set up test environment
+mkdir -p include/config
+mkdir -p include/generated
+
+tests="single_symbol.sh two_symbols.sh"
+
+
+for t in ${tests}; do
+
+	rm -f dot_config.expect
+
+	sh $t
+
+	if [ -f dot_config.expect ]; then
+		grep -v ^# .config > dot_config.actual
+		if ! cmp -s dot_config.actual dot_config.expect ; then
+			diff -u dot_config.expect dot_config.actual
+		fi
+	fi
+done
diff --git a/scripts/kconfig/tests/single_symbol.sh b/scripts/kconfig/tests/single_symbol.sh
new file mode 100644
index 0000000..6459fcf
--- /dev/null
+++ b/scripts/kconfig/tests/single_symbol.sh
@@ -0,0 +1,11 @@
+cat << EOF > Kconfig.test
+config SINGLE
+	def_bool y
+
+EOF
+
+cat << EOF > dot_config.expect
+CONFIG_SINGLE=y
+EOF
+
+../conf Kconfig.test > /dev/null
diff --git a/scripts/kconfig/tests/two_symbols.sh b/scripts/kconfig/tests/two_symbols.sh
new file mode 100644
index 0000000..c31902d
--- /dev/null
+++ b/scripts/kconfig/tests/two_symbols.sh
@@ -0,0 +1,14 @@
+cat << EOF > Kconfig.test
+config FIRST
+	def_bool y
+
+config SECOND
+	def_bool y
+EOF
+
+cat << EOF > dot_config.expect
+CONFIG_FIRST=y
+CONFIG_SECOND=y
+EOF
+
+../conf Kconfig.test > /dev/null
