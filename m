Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956789;
	b=OxOm+87GY9mYVpb+yi6VJmohHe2vayli0Lb32hQ1lV4eqPKPRQZUpAf99jRaGtc6Ac9W
	 6gw8jOAiNFRR7v5eJQP7OyGkzSQcUtxMqk8gyAiT6A0NwwW5Jy+nvCXbc7PR5n+FPKXPh
	 g/zlzQSIlPpVTdDoeKhgjl6QVcwCUQGGY2L9WQwa2D2OzPOm4mjuW+zmHKkY86LWy9xNh
	 D2QWojlN2vbdj+P6onlBD4K2e3Pl47lHACc/y+oVLNcz5bkrI+e99e0oFwJvc2s3sJtQ8
	 zL/mUkIs+gLcXCO1JLVmZEGy6tFoxGsCsnWNrVKZF62Zi1X39eAq5Qlx9onJU/G2Diw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956789;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gA+HBbgvhH3TqPALFNvJFPd1CT7l+jS3gaNMMqkUdKY=;
	b=YE79+FSX8aFOkxjXwBoH0C4TBS9Xwh2UQnwXtG3AUHpEq3X1hUVn9pQSzwzVlleSErD4
	 zS7u+Ku5rQxMVy+6Lx3SecaxMkIsqHKAkQ22CnzHEE1GNICw+UMvoBFrdKWE195aSLw1r
	 opLuzlDCyhhdtbqxmeNOj6LmkoRw10EN/VlafXoOR9e8DqUPQtLC085FXOEuJYiE1fAnG
	 sr4/7DMUz4cY18ZgJP+g74F1j5SldhtqwLI41KFiHMQbWeO4crMlD2LhDi6Ghfih4364A
	 mzg/QiwIFvR57pJ8xPu6abaIhYC5Dzkw0y0eZrIGiXhvK1SVZliOBVXx+XbU/2UErhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=j95imOvs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LexXo5HP;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C863606A32D;
	Fri,  6 Nov 2026 09:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C863606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=j95imOvs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LexXo5HP
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793956787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gA+HBbgvhH3TqPALFNvJFPd1CT7l+jS3gaNMMqkUdKY=;
	b=j95imOvsVCyg2J6p+fEYFU5kDH1q1rqSf5tWUvuUTELxpiXtFvvSDeR1IqCKwvYKHl+qoc
	tmabwPohYby3yh+VK33QESZ31pGlTVz+IvuUxFvML9+GCsNeX2CkQi4Msvj7OVZVrfSXXf
	UxghtgUf0vrpnaOhiIO8JMJGFbo2SX/9uvxmZMt1BfSz7IVKZpHEHdzDliPTDk2rVZaJtI
	X8+rmyDBXsy0driwCVsD6bu0j3fvFCSaxX0yRUwnGeGdH8EiCsY7z1GPqOZZiPGqSQZMgL
	qyZwmS9FUQdYQkXxjhA3tQccOynoipMHhn1YS5n448ny1HuDpKMu2by7WP35pA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793956787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gA+HBbgvhH3TqPALFNvJFPd1CT7l+jS3gaNMMqkUdKY=;
	b=LexXo5HP9LOPwrfLo7bXu4J3ILKOLDekchNGeKcu9fb7a4bHD3SInjmogvHY1dWoDRg6Sb
	jBUW40X7JumZZACQ==
To: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Derek Barbosa <debarbos@redhat.com>,
	=?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	linux-rt-devel@lists.linux.dev,
	debian-kernel@lists.debian.org,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 04/10] kconfig: Introduce checkconfig target
Date: Fri,  6 Nov 2026 10:19:16 +0100
Message-ID: <20261106091922.7560-5-darwi@linutronix.de>
In-Reply-To: <20261106091922.7560-1-darwi@linutronix.de>
References: <20261106091922.7560-1-darwi@linutronix.de>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a checkconfig target to validate the current kernel .config against a
set of rules.  Select the rules using a mandatory RULES= make variable.

Example usage:

   make RULES=preempt_rt checkconfig

Use the kconfig-checker to perform all sanity checks.

Document the new target at the 'make help' text.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 scripts/kconfig/Makefile | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 5baf1c44ffa2..d67a23730259 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -125,6 +125,26 @@ testconfig: $(obj)/conf
 	$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=no)
 clean-files += tests/.cache
 
+checkconfig := $(PYTHON3) -B $(srctree)/tools/kconfig-checker/check.py
+list_checkconfig_rules =						\
+	echo -n >&2 "Available RULES: ";				\
+	$(checkconfig) list-rules >&2;					\
+	echo >&2
+
+PHONY += checkconfig
+checkconfig:
+	$(Q)if [ -z "$(RULES)" ]; then					\
+		echo >&2 "Usage: make RULES=<profile> checkconfig";	\
+		$(list_checkconfig_rules);				\
+		exit 2;							\
+	fi
+	$(Q)if ! $(checkconfig) list-rules | grep -qw "$(RULES)"; then	\
+		echo >&2 "Unknown RULES profile = $(RULES)";		\
+		$(list_checkconfig_rules);				\
+		exit 2;							\
+	fi
+	$(Q)$(checkconfig) check -r "$(RULES)" -c "$(KCONFIG_CONFIG)"
+
 # Help text used by make help
 help:
 	@echo  'Configuration targets:'
@@ -154,6 +174,9 @@ help:
 	@echo  '                    default value without prompting'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  '  checkconfig	  - Check current config against sanity rules specified by RULES'
+	@echo  '                    Example usage: "make RULES=preempt_rt checkconfig"'
+	@echo  '                    (requires python3, PyYAML, and jsonschema)'
 	@echo  ''
 	@echo  'Configuration topic targets:'
 	@$(foreach f, $(all-config-fragments), \
-- 
2.56.0

