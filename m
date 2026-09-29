Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778193AA50B;
	Tue, 29 Sep 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668808; cv=none; b=hl3k1vf0kydRhfHvaN3n+pQmV+bn60CK8g8xBUUD9pOWHnHhuu00trw00p6WqHwaMC81EsL5VwSuygd8U7SMe/pKHimxAxrh2zPfnEy8icXj+HSQr/atKdd7U69pgwaFPN30KItx/v6sJInN0qtwEKyr/QQTMOrRwk7c7fur47w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668808; c=relaxed/simple;
	bh=Qi2U/Wv31URWTyz29QDUAuNGOMbiXTRnpP6Yksp1fRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLq6CJ3RJ+mwuui202CcKFhgIuq8kj5eqUGApcKgIqJgAdfgOVZ7MJ/JJzgxEj2qBW2z2AZRpesFPd9SQObdUbLaUKAiPn/w703t+8rDxiaH+4NYRx+MCBYib9+sqLWibG8pBS19htV3bZPesYwX+/R+7DWbMYmwH0pImA7Khi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=Hvy30Gc1; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="Hvy30Gc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790668793; bh=Qi2U/Wv31URWTyz29QDUAuNGOMbiXTRnpP6Yksp1fRE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hvy30Gc1qZmsEx9ptR5TCUotlKYcAaw37KAv5OGfLIX6Iia4fS+cf6dIZpAZzIeO7
	 FXviWjCiuijnpd3U5vKLAtmZCNSZqI0ecZ3Ylb6i30/bNCGlUPuKZKUZwvB6XVCpeM
	 KBVyCgUQwMwJWE2lgOpjU1Z5yJYyBUIL5N8xlQNAam4UfHFNZW3Fbs3qhonBSO1v29
	 Pt/q46tkhAci9aUdXpSsqRLJvaiSpTyDIsrdT0tTd6VhyNE0AkHkeaOkA1yuO9e1ol
	 RHCLxlpa2tLvszFWIDFSrPEEqRDiP6VOLnrB+aZgcZYEmDPOtMJ3mbV4ygIRHyWikE
	 W9rDd2unk74tA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6abb6ff9-03cd-7f0000032729-7f000001c75c-1
	for <multiple-recipients>; Tue, 29 Sep 2026 09:59:53 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 29 Sep 2026 09:59:53 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Tue, 29 Sep 2026 09:59:44 +0200
Subject: [PATCH v2 1/4] kconfig: tests: Reset all KCONFIG_* env variables
 by default
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kconfig-tests-minor-updates-v2-1-c5902bee1d0c@fritz.com>
References: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
In-Reply-To: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=Qi2U/Wv31URWTyz29QDUAuNGOMbiXTRnpP6Yksp1fRE=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqu2/3k9lSb6Csxf2jGjstWcUrfPSqqyPSeqKfw
 PMANxRTFO6JAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCartv9wAKCRCIxryciJpt
 uFQBD/4s798x+6vCBUFskwj0artDXEiWTGH/D5ZUyVU+wKGIvrjgRIdqq6iKfD5JTS8X6WNqBwG
 T+gt8ZQBTjRBXGW/ToFH7EJG6T4px0FFfu2yVbe8uSuZCdjZCntWUHWJKuCfLj9AT6fIl2efzU3
 08dRROjv2kmw321HZ00hHio21yiSDngDPy58IjCRym2vVJnMKdYo3KbwdAXhoXjFKH/nTB836Gb
 cRL5fEzcX3ogl1uvJOh20ltpL8xA7ktY49Cz+dQsF+kg/S/4hJ/p35LwirzHsfo+uczqSkYer6e
 txvxphVo+a5EWTIuwYzbxUjHYPhJpwEzYv6yWb/nOzaqe1HMbajMRn1ZgmadDODMEIM4zqHz2PA
 pB0lA8hexInHMthDSohYWxm5iS4NzzjeS4FTwiG3Icr9ppoONJnuSFwcDF0vYIkqV3/boWSdx0Q
 L64YkW6O8Y47YTm6ztrUmmaFv0eKFQ7x/n+UX94DuxUurr1jqqdYRgqVlwjLFi8xVTfHUWJsa0q
 xrcSKYStJK4dJcouzAaPKZsILKUkABJk4EzCwEB7LVoTgRwgzooOFY2PJ8FEzW3bKJqr6fz+y36
 3CFErz1IAQSoaf12Neiq6oj4eEeoAju0gBzgnIO11vTMq8uohCAUAk14dDS/lQSRgcCMl86ETzk
 i28n8dL8Hsbp2Cw==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790668793-2F7DCEE1-AAE96C99/0/0
X-purgate-type: clean
X-purgate-size: 1933
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: E00CCA0816  external: no

Reset all environment variables with names starting with 'KCONFIG_' from
the user-provided environment.

This fixes the 'warn_changed_input' test on systems with
KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.

Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---

Changes in v2:
  * Reset all KCONFIG_* env variables, not just
    KCONFIG_WARN_CHANGED_INPUT (Julian, Nathan)
---
 scripts/kconfig/tests/conftest.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index 66f95e4ed58c..de8e555cd951 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -57,9 +57,12 @@ class Conf:
         # Override 'srctree' environment to make the test as the top directory
         extra_env['srctree'] = self._test_dir
 
-        # Clear KCONFIG_DEFCONFIG_LIST to keep unit tests from being affected
-        # by the user's environment.
-        extra_env['KCONFIG_DEFCONFIG_LIST'] = ''
+        # Clear all KCONFIG_* environment variables
+        env = {
+            varname: os.environ[varname]
+            for varname in os.environ.keys()
+            if not varname.startswith("KCONFIG_")
+        }
 
         # Run Kconfig in a temporary directory.
         # This directory is automatically removed when done.
@@ -75,7 +78,7 @@ class Conf:
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE,
                                   cwd=temp_dir,
-                                  env=dict(os.environ, **extra_env))
+                                  env=dict(env, **extra_env))
 
             # If input key sequence is given, feed it to stdin.
             if in_keys:

-- 
2.55.0

