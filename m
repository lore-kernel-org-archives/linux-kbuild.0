Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D03B05BD;
	Tue, 29 Sep 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668807; cv=none; b=SXKXYX0rHMnzSKk3ucQ/w3iCsPm9nT73fMB9J2COKRQYsVvnf51zarcN2/C5uR8QsDpk3xIqU7Iy1BTmpQaP0+VXWCQ86IiNRFC4ULmTf31aJsW2FuWextfPfR7OqZBg9UwIkBU3EBSfgg1iB1JOV6ZGpQ0M8YgwqfPG55ac/E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668807; c=relaxed/simple;
	bh=oEeC6rMfM0Mlqaf436sK3Jo/2dpFsItV/JFDu1BOghA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Chv65ymm41foEKO5jOdn9+uqCbUsvIoTq/chJhKN8XrzthQquv9/DLk2eGrB3KoarVCOzn4RODcdr+QWjgYw5BxGc5V+YFBrHtk2IAZJS/5QprFvzxB6ZgfH4KBNPlvyuPIPnQLQDwFQBc5Q4h0ceMnV6jfxTbc+8Dq+uOts2NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=fMoIPQi3; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="fMoIPQi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790668793; bh=oEeC6rMfM0Mlqaf436sK3Jo/2dpFsItV/JFDu1BOghA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fMoIPQi3hg8VjYA6MNswmaLSv/5wkY5iX/UT5wK7SGYFkDF1atnxs1h2hAjXbihms
	 YQKSDJKqwGSPZdlX/i/8MZ2GJNrMTsJ5dDUNtRnpbOau7K7D2X9D9r5VZRpOQNxN5t
	 QrIuz1DvBa7rWMyzJZWj/H6rR9vGWI0PKn89A2XmgNXe58Y4cWLuo0pzgAyA62mf6p
	 X4KXsU+fUrCMzvr/vjl9hRm8MJzZwIjqLdULepqvqxahQ8w2dBOWaXRWOdhccwDNp1
	 p2TCxw6xi3DYymupDLm+id17RV7rgbX7EEl8fZSCvU/UZtkDM1weMR/EVYaziPkJzW
	 6RmkuLgMUiPDQ==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6abb6ff9-0449-7f0000032729-7f000001b792-1
	for <multiple-recipients>; Tue, 29 Sep 2026 09:59:53 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 29 Sep 2026 09:59:53 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Tue, 29 Sep 2026 09:59:46 +0200
Subject: [PATCH v2 3/4] kconfig: tests: warn_changed_input: Simplify by
 reusing the extra env
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kconfig-tests-minor-updates-v2-3-c5902bee1d0c@fritz.com>
References: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
In-Reply-To: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2117; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=oEeC6rMfM0Mlqaf436sK3Jo/2dpFsItV/JFDu1BOghA=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqu2/47ZUtmbUkd/Qidw6oHXUMgO5GrqC45L2d4
 L6uHDOQtYSJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCartv+AAKCRCIxryciJpt
 uC1OD/9mJ7QRJteXCy9q1IKXerGJXgzWQ9FrMaPViJaNmhhLDiUynnrwTdL/e5Zc9ZpO34uCOOh
 AsTqjLyO76y+NsWDm0XFK0LmW+2c/Js873pC5MxAYxUyJgXyA96L4ON88E2rc5IINnBRkwkIT2W
 7JpLdN0Yrlu5zPzd+gPWSLidaatbkG6sE5mBlODuF+0n7pqlYViGLUqmSI7zz/ymAdCr0Tv+f/+
 xCFBtEq3NmuItv+1pGuh9NVODkkHWoJNELleCmIzwl7p/bFmrK1omlj5J2r0X2QeB59UAvoZ432
 jBzOBy3vqOxKQdQNm7n7rZZvCHJKT7zme8hyRMc63hZbgu+Axl5fInRfb0alGa1YSJexqvOlsaf
 hPiOeZO3S007j6cPedQXvzW5PCQ4J3e/dQHKWlW21kseByMqJVcIWr/JlwTikYyp7qF5VeJ486F
 d4Dj22jB/qFqtvTWLGv5Y4bqg81a98hWh+sEo9j86IDKoXEFQd33Fr+JPTcbTDdjD39nv/QBRjA
 xgfzqnUCR9LRn8QZwfPZiWdfEbmoCA3TWrKXlIHLEtSwFtMM+HrM/cnxWCHq0falQw8d41M34l+
 zUu2SQNqnWI1QU42U8SgntXXPWW6E47IWT2g4iEuvYjuuFjblaA4XfVcnnBeRqm7RRDQZjK+AOT
 jVJatQYsCLAlskA==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790668793-29FC9965-860AF9C4/0/0
X-purgate-type: clean
X-purgate-size: 2119
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 2F482A0158  external: no

Define the extra environment once and re-use it for the respective
_run_conf() calls to increase readability.

Reviewed-by: Julian Braha <julianbraha@gmail.com>
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
 scripts/kconfig/tests/warn_changed_input/__init__.py | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/tests/warn_changed_input/__init__.py b/scripts/kconfig/tests/warn_changed_input/__init__.py
index 4c3bca6af846..a5f07d4a882c 100644
--- a/scripts/kconfig/tests/warn_changed_input/__init__.py
+++ b/scripts/kconfig/tests/warn_changed_input/__init__.py
@@ -8,26 +8,24 @@ KCONFIG_WARN_CHANGED_INPUT is enabled.
 
 
 def test(conf):
+    warn_changed_input = {
+        "KCONFIG_WARN_CHANGED_INPUT": "1",
+    }
+
     assert conf.olddefconfig('config') == 0
     assert 'user-provided values changed by Kconfig' not in conf.stderr
 
     assert conf._run_conf('--olddefconfig', dot_config='config',
-                          extra_env={
-                              'KCONFIG_WARN_CHANGED_INPUT': '1',
-                          }) == 0
+                          extra_env=warn_changed_input) == 0
     assert conf.stderr_contains('expected_stderr')
     assert conf.config_matches('expected_config')
 
     assert conf._run_conf('--olddefconfig', dot_config='config',
-                          extra_env={
-                              'KCONFIG_WARN_CHANGED_INPUT': '1',
-                          }, silent=True) == 0
+                          extra_env=warn_changed_input, silent=True) == 0
     assert conf.stderr_contains('expected_stderr')
 
     assert conf._run_conf('--savedefconfig=defconfig', dot_config='config',
                           out_file='defconfig',
-                          extra_env={
-                              'KCONFIG_WARN_CHANGED_INPUT': '1',
-                          }) == 0
+                          extra_env=warn_changed_input) == 0
     assert conf.stderr_contains('expected_stderr')
     assert conf.config_matches('expected_defconfig')

-- 
2.55.0

