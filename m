Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1592053FD32;
	Thu, 17 Sep 2026 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652325; cv=none; b=OVbDHA5+BTxCCyyUdrvZSAYckNQ6wKUPoDG41mpvymkhobqDnnvaMpOJhS3aFtJNE2Jb75bWAx8T7tRhsu11kRu7gC1HlQyal6XFwILJuzjFrJzrD80cgFG4h3kwlGkVplx32/Fap8I4lupNZv7sa09Mwg9deY3aaPPN3gJPbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652325; c=relaxed/simple;
	bh=xVKPGG+qhVYA5OOsvuxOa0KAMCyYJOJGQ6hLq9Cu44Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LYH/KN2pz1Nr5radjiie6L9o8EM/pGIfQV6DyFYQrgW7zwHukoSiTerTViVROnzO9HedIHxYQ2lx8sB2lfDZjVQM+01E1dSkjrpznVp18Dq4UD+p0aGttE85Zt3y5kVZ28G4gmStE1aIO+QJLZlzI7nv887Aiwq+8cYFCya9OG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=e7+GH8PW; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="e7+GH8PW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789652309; bh=xVKPGG+qhVYA5OOsvuxOa0KAMCyYJOJGQ6hLq9Cu44Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e7+GH8PWVyTRgrM1EvlTkoBgsV1vupylH7bxbpE+Flz2rZu/X+EeqGD6nJY5kjIPz
	 oegP7iEUv9E3aJBQhu+w6ZagMsFpvKeo0+KqKcJvML4EWTs3Xnt7z5iazI51Of8Iox
	 w/AMHIcuENa10L5XeEb+ZJXzzQ11LfQRY2KSwr2RQtUwsjwEFU+ZewXmu1K+COHRM2
	 ziLDDxMwsxrJPsICsc8l72uTLKz9kJSWUHFg93fCE7pUkxIBmuV0unlwqB5+gMpo3t
	 hourrrcA0WV49qexQNo1uouJKV7X3TjnXgJVEiP1fBfP3GvbzBLmQQaO6WHN84Vy2h
	 iFZfY99je+Cpg==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aabed54-ea3f-7f0000032729-7f00000194ec-1
	for <multiple-recipients>; Thu, 17 Sep 2026 15:38:28 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 15:38:28 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Thu, 17 Sep 2026 15:38:20 +0200
Subject: [PATCH 1/4] kconfig: tests: Reset KCONFIG_WARN_CHANGED_INPUT by
 default
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-kconfig-tests-minor-updates-v1-1-286e5c985244@fritz.com>
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1556; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=xVKPGG+qhVYA5OOsvuxOa0KAMCyYJOJGQ6hLq9Cu44Y=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqq+1Safsdyl5QoKAnTNwR2ug/SGFtawz6+nag2
 LgaVmyz31qJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCaqvtUgAKCRCIxryciJpt
 uC3pD/4p1l3iykqwW/RTfSjexJlJYflYqjc83WuNkTrB4/xvU4lh2ITNZv4D0Kzs4yqeQKtX5WE
 wqfIQZbuLMlVyAHNQLxyFAHGrrg1y5icxvOfSubhdvppSERyprbxonTF1ZRG130RvzIvfs5w5vg
 4yJFejPv/3klhgIWK95r+M4e9in/nTrNPpl6u55CZSeGarv/vCcreCzpM0dk2tgEQ7QKgHTe/ID
 yuVClGGc/OobvnfKN8kA7MgSSmuvHqatnbp3rMWDXQln+iZ+Jl5WXsAGB1DhEM6zcz6Xq7ETdup
 BTqfz7wDH93TWxdta9Y4QfrCleo8lbRhrXDxwrVqvIL8YQn91Pnq4zSkm2O+5NKmWM0IzdC/oQd
 nm5nBsOkEl7cBlAkYuX1zI0jcL9hcPEeJtZS8bD16NILIz4W5j/Vb1M90XWqsgbVYJgj+BHRER+
 0epjPL4K8KFeCxuKa3oWlvocClAQVRqCfmZyZRclsGxvYuwDEoHNpEgbPEFyZx36H2wzjPBhEdl
 uswdPHdt609Xm2xJRve5cRMR3Qp4aQscKPt7D0u0um+8f8HhPrwhQaiS/xZ1EiXiGCIiIAWkkxp
 rzICnVQCPjRYkOyHAbpC4+h+h/imVOS/5P8HK5x1jBSIe8jq8+tR6KKrixjK82cBP056qW43fCK
 hfFoi5oVxB+r2nw==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1789652308-044F8720-41EB1842/0/0
X-purgate-type: clean
X-purgate-size: 1558
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 06CC8A048F  external: no

Reset KCONFIG_WARN_CHANGED_INPUT by default for all kconfig tests but
those which set it explicitly.

This fixes the 'warn_changed_input' test on systems with
KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.

Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
 scripts/kconfig/tests/conftest.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index 66f95e4ed58c..e92f0cf1421a 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -34,6 +34,9 @@ class Conf:
         """
         # the directory of the test being run
         self._test_dir = os.path.dirname(str(request.fspath))
+        self.default_env = {
+            "KCONFIG_WARN_CHANGED_INPUT": "",
+        }
 
     # runners
     def _run_conf(self, mode, dot_config=None, out_file='.config',
@@ -57,6 +60,11 @@ class Conf:
         # Override 'srctree' environment to make the test as the top directory
         extra_env['srctree'] = self._test_dir
 
+        # Set default environment variables, if not set by caller
+        for var in self.default_env:
+            if not var in extra_env:
+                extra_env[var] = self.default_env[var]
+
         # Clear KCONFIG_DEFCONFIG_LIST to keep unit tests from being affected
         # by the user's environment.
         extra_env['KCONFIG_DEFCONFIG_LIST'] = ''

-- 
2.55.0

