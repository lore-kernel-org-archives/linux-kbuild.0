Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7647F786;
	Wed, 14 Oct 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967014; cv=none; b=G+w8cwsUNLKDSDDYNB+nQ4jpdazWBB4WApqB1lk9K2P/QLr2osLqvfMhELLirr04qQDteEsIZr9Bc+7mGscmaDqZKQKwpj1jt2EoYP/lep6ziJ54zdvmGC7C5wKW0q82GAaR5xtHceCDw9e7Lpnmd6Vdvrs+bbHh/C5yzifEDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967014; c=relaxed/simple;
	bh=SKHhHsK5UjimsCdVlj8Lv3822tqLi/nS1N/X3ZsqCHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qby88alFZF64iMxFLFn3Gzm5u8lHX0/YRh3CMqgMPqjpzlYZsnUC22HIb0CcEUoJq/LMJ56AIXl9GS998FY2ViYx7zPkYCPGKHV/x1GE1P7GMQMBK/qxSS6oaH4DrtNEBoLtZvAso7QTYrV63wMZRAu9SrXZFxVcO9dJWIkUsw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nlETQ4Jy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ukg/x/eg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nlETQ4Jy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ukg/x/eg"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791966635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vaw1ptHsHLftpWKXUcbIKliOUquNWWHWqIT8fiURSkY=;
	b=nlETQ4JyAvu/+4BAHtVZkPx42LtEMeCzS6JgjHJKncMn5bDPDj2xB3r1ipr9xzw7oKmMDH
	Udspe8EIwtf55UD8R+jt3aXSMhcvWYU9ye2J71UQic9exiErTGr7Yk1hqBYKHiYqEXOkP9
	5vxqu4H8t/kl1d6syRCZkb/+ek/yuPRPurrqrCLrm6u2PLLlc2MfqPPejsXsPUqkynSEFW
	g//LP903DK2ioCr3mjjwOmqzT5MhgqU0ANq7ee3AbszqHyNinsQgrOgEBkhYxJl+a6mcj1
	l2pGQoYu461rrIwid7+PvuFEOLF6jzxtAl9cAVwjN5/bV7s8wo19Y+8lFhScjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791966635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vaw1ptHsHLftpWKXUcbIKliOUquNWWHWqIT8fiURSkY=;
	b=Ukg/x/egs4PZnWdHDDgw6inmvRnhRJ7uqYoSh/43kq1eC8ODsTv6JQcXVZ5cn4vKihU4es
	29B7EHrhLB1+9jBw==
Date: Wed, 14 Oct 2026 10:30:30 +0200
Subject: [PATCH RFC] kbuild: enable pipefail for commands where possible
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-kbuild-error-propagation-v1-1-573adaa0a076@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nj3eyk0sycFN3UoqL8It2CovyCxPTEEqAmXYvEJNM0MxPLtDRjMyW
 g9oKi1LTMCrDR0UpBbs5KsbW1AKZsp3NvAAAA
X-Change-ID: 20261013-kbuild-error-propagation-8ab5f649ff36
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791966633; l=1868;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SKHhHsK5UjimsCdVlj8Lv3822tqLi/nS1N/X3ZsqCHo=;
 b=oTkLBk1cMk9xJOvIljXrmOaPQ2weE4iYGwwdmD7iBix2NW7IbjOWSlnEOrH7/4gACaT5r4DOI
 yRs8d1FhtZ0CSxdROyySTshKqE4EpOnQRHBqS6l7pdx945zSbrvTmPW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The exit status of a shell pipeline by default only depends on the exit
status of its last command. If an earlier command fails this is silently
ignored. In this case the build continues operating on intermediate
state, potentially leading to confusing follow-up failures.

The 'pipefail' option can be used to exit the pipeline with an error as
soon as a single of its command fails which 'set -e' will elevate to
error exit of the whole command.

'pipefail' has been only standardized in POSIX 2024, but it is supported
by many shells anyways, including bash and dash. To avoid issues with
shells not implementing it, ignore failures silently.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202610131613.BpOi6VPp-lkp@intel.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/Kbuild.include | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8c311b997e24..1975d2739cdb 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -149,8 +149,11 @@ delete-on-interrupt = \
 		$(foreach sig, HUP INT QUIT TERM PIPE, \
 			trap 'rm -f $@; trap - $(sig); kill -s $(sig) $$$$' $(sig);))
 
+# try to enable pipefail
+try-pipefail = set -o pipefail || true 2>/dev/null
+
 # print and execute commands
-cmd = @$(if $(cmd_$(1)),set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1)),:)
+cmd = @$(if $(cmd_$(1)),$(try-pipefail); set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1)),:)
 
 ###
 # if_changed      - execute command if any prerequisite is newer than

---
base-commit: 27286bf096c51df05eec6664f18b945f8dd61c0e
change-id: 20261013-kbuild-error-propagation-8ab5f649ff36

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

