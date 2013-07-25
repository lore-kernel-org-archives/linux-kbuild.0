Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:64575 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756969Ab3GYUVP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Jul 2013 16:21:15 -0400
Date: Thu, 25 Jul 2013 22:21:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Kconfig test scripts
Message-ID: <20130725202112.GA17599@merkur.ravnborg.org>
References: <20130720141905.GA10229@merkur.ravnborg.org> <20130720144402.GE3507@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130720144402.GE3507@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

> 
> How would one express a test for 'choice'? Test randconfig?

I made a minimal test for choice - see below.
Each test is an independent shell script - so we can in each shell script
do whatever we which to do.

This is still WIP - I will let you know when I have something 
that I assume is ready.

I am away for a week - so do not expect prompt replies.

	Sam

diff --git a/scripts/kconfig/tests/rand_two_symbols.sh b/scripts/kconfig/tests/rand_two_symbols.sh
new file mode 100644
index 0000000..ce5c482
--- /dev/null
+++ b/scripts/kconfig/tests/rand_two_symbols.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+#Randconfig with two symbols
+
+cat << EOF > Kconfig.test
+config A
+	bool "A"
+
+config B
+	bool "A"
+EOF
+
+rm -f dot_config_y.all
+
+for i in $(seq 1 10); do
+	KCONFIG_SEED=$i
+	export KCONFIG_SEED
+	../conf Kconfig.test --randconfig > /dev/null
+	grep "=y" .config >> dot_config_y.all
+done
+
+acount=$(grep A=y dot_config_y.all | wc -l)
+bcount=$(grep B=y dot_config_y.all | wc -l)
+
+if [ "${acount}" != "" -a ${bcount} != "" ]; then
+	if [ ${acount} -gt 0 -a ${bcount} -gt 0 ]; then
+		exit 0
+	fi
+fi
+
+exit 1
diff --git a/scripts/kconfig/tests/run.sh b/scripts/kconfig/tests/run.sh
new file mode 100644
index 0000000..5f3a6ff
--- /dev/null
+++ b/scripts/kconfig/tests/run.sh
@@ -0,0 +1,40 @@
+#!/bin/sh
+# set up test environment
+mkdir -p include/config
+mkdir -p include/generated
+
+tests="single_symbol.sh two_symbols.sh rand_two_symbols.sh"
+failed=0
+passed=0
+
+for t in ${tests}; do
+
+	rm -f dot_config.expect
+
+	echo Testing: $(head -n 1 $t | cut -d '#' -f 2-)
+
+	/bin/sh $t
+
+	fail=$?
+
+	if [ -f dot_config.expect ]; then
+		grep -v ^# .config > dot_config.actual
+		if ! cmp -s dot_config.actual dot_config.expect ; then
+			fail=1
+			echo FAILED:
+			diff -u dot_config.expect dot_config.actual
+		fi
+	fi
+
+	if [ ${fail} -gt 0 ]; then
+		failed=$(expr ${failed} + 1);
+	else
+		passed=$(expr ${passed} + 1);
+	fi
+done
+
+if [ ${failed} -gt 0 ]; then
+	echo Test cases failed: ${failed}
+fi
+
+echo Test cases passed: ${passed} out of $(expr ${passed} + ${failed})
diff --git a/scripts/kconfig/tests/single_symbol.sh b/scripts/kconfig/tests/single_symbol.sh
new file mode 100644
index 0000000..dc03a8c
--- /dev/null
+++ b/scripts/kconfig/tests/single_symbol.sh
@@ -0,0 +1,13 @@
+#Single symbol with default value equal y
+
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
index 0000000..7081c1d
--- /dev/null
+++ b/scripts/kconfig/tests/two_symbols.sh
@@ -0,0 +1,16 @@
+# Two symbols with default values equal y
+
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
