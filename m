Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E533AFAE3;
	Tue, 29 Sep 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668808; cv=none; b=gxbCnrQ8T66pR68pZhA/gOBB9eEekI76pS2h6j/fXoGolVwMfKEvBdF5/C0MIAXR67CDdgHJ8RJz/ihKLKQELoCgusW0Z5VHFs2EtBTwbRAPsgJsIHJZ/fqQXy/Xs3gK9+baR3S/nGqUl1DNykeJxM5OOEezNabR/0/FyjHuGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668808; c=relaxed/simple;
	bh=mJxfmuntrS6Lc1ef/BTMcihmrHnPcFu0Ms2DI2wlof0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mmYbLFOFB5e3bkajP4ecBEkulrpWpAQoerPtaim4k3i44dx/FiAYjNqQ19+jwS3unK4WEvysscVqepBTJBlPchSMd17StY6i30mV6fkNCAtsFVQEnGXnBc1N/Awlth3zrEQuhmbF4ZvOrGTabQK5P8vFM6GOvRUbIgmAOsaESDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=eEkWiXRA; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="eEkWiXRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790668794; bh=mJxfmuntrS6Lc1ef/BTMcihmrHnPcFu0Ms2DI2wlof0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eEkWiXRA1ZRyZeLsVeKxHi4n3WFGZ8ALPOfw8dUn+P64XpG+o9AM4qdvxV9tz4MLZ
	 jVdBhT4C010GQZOyJ3dCzRDA8HK0nZ/u2G5zquqqkClywfxChjO5E0X6GUCXtoSq+O
	 ynG81xKVHgnd981iKbrEhisTUwkdHsgDqEDLEBZJO5cjSV0JEwCWGXbEzXWS1iXJgg
	 cQrN8ie2sczjeTkqsUDvHKVV/Wsqf3gtkD5n/Ee4IZBpC5IIWbQHxeM+TpL8rgBm7N
	 SBADCIzT6YmIau513x72frHTiYxHbFJRxSw2FSQuLmbgTe3yMndSjBHjAKWy6xfVGJ
	 1m7aK47qO26oQ==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6abb6ff9-03d5-7f0000032729-7f0000018808-1
	for <multiple-recipients>; Tue, 29 Sep 2026 09:59:53 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 29 Sep 2026 09:59:53 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Tue, 29 Sep 2026 09:59:47 +0200
Subject: [PATCH v2 4/4] kconfig: tests: {old,save}defconfig: Forward
 dynamic keyword arguments
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kconfig-tests-minor-updates-v2-4-c5902bee1d0c@fritz.com>
References: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
In-Reply-To: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3857; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=mJxfmuntrS6Lc1ef/BTMcihmrHnPcFu0Ms2DI2wlof0=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqu2/4kBtZYEHaNjRInHj7JXKTZgTjUo5f6qWZs
 TDZ1Y+8e+GJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCartv+AAKCRCIxryciJpt
 uNkuD/0XJr2d5PwAKvvFB7BOfx0X8FZsx+eWgvZImEejF6kjaGA5Ge8lSNtCVPIfucfG9HzSDEi
 +5ZkQ7bVQFCg5kNq06HnBIyW4CxmOIF+Xz+LYQ37Whi11ctTATWJYWWVk/p8AquUA9LuPAUwuL8
 ZDP34f4pnlmK8jQBBxA3+/Hxj4NWc+bm2pha/61gvry1Xie6vo0KB+SGiJw5ITQBoigI739Ej92
 qryATsU3jRjXM6WeGA5zy8i4df4TDNGlnLaPmXECQJN4RnKSJcfqZHnbRyLL4crMgxP3f+UH3eM
 2Npxop+029KULitEbnAbJ2f0QjWROW7+lQaLmWylHGPJO3QFRLbSBGhT2Ui2hiWSpbwHexRwEzP
 kebUIAT8wsQKl7/CasEtSoh2i1KAWxFyvzfiSdlLklYmWHvKnQP8gz80wgOEKCYV2SK3SLE98ob
 AHe+h04BTtUrhdkeW2+kSZnmmqcSlPx7r/D/p7cUenw3nZwK2jhxOQoRVJ9jVFIncJAcxMumusQ
 VBkbzGVgQXbYYhCXpq0JI/S1jifbIL7ZR05MCj0ofXT4v9U1MjHcX0lW6AlnxQnCcsTgdnfvHFZ
 vNm2iwZ/mI2B4FsGSQ1wCGWron/o+1/t4VmGpyxbAI4YxWYdv8T/8jwZ3vmV+AcayB9FJtgKdZ3
 ItapESMN26UXBog==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790668793-82FDBEF9-BFB7AAE7/0/0
X-purgate-type: clean
X-purgate-size: 3859
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 0C3A8A0434  external: no

Let kconfig test framework forward dynamic keyword arguments for
'olddefconfig' and 'savedefconfig' and update the _run_conf() calls in
warn_changed_input to use the corrsponding wrappers instead.

The warn_changed_input test needed to use _run_conf() as the
{old,save}defconfig wrapper did not provide the necessary flexibility
for common calls.  With dynamic keyword arguments, there is no need to
use the framework-internal _run_conf() any more.

Reviewed-by: Julian Braha <julianbraha@gmail.com>
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
 scripts/kconfig/tests/conftest.py                    |  9 +++++----
 scripts/kconfig/tests/warn_changed_input/__init__.py | 11 ++++-------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index b2539e51e2a6..97ae0f79d03d 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -159,13 +159,13 @@ class Conf:
         return self._run_conf('--oldconfig', dot_config=dot_config,
                               interactive=True, in_keys=in_keys)
 
-    def olddefconfig(self, dot_config=None):
+    def olddefconfig(self, dot_config=None, **kw):
         """Run olddefconfig.
 
         dot_config: .config file to use for configuration base (optional)
         returncode: exit status of the Kconfig executable
         """
-        return self._run_conf('--olddefconfig', dot_config=dot_config)
+        return self._run_conf('--olddefconfig', dot_config=dot_config, **kw)
 
     def defconfig(self, defconfig):
         """Run defconfig.
@@ -229,14 +229,15 @@ class Conf:
 
         return self._allconfig('rand', all_config, extra_env=extra_env)
 
-    def savedefconfig(self, dot_config):
+    def savedefconfig(self, dot_config, out_file='defconfig', **kw):
         """Run savedefconfig.
 
         dot_config: .config file for input
+        out_file: defconfig file for output
         returncode: exit status of the Kconfig executable
         """
         return self._run_conf('--savedefconfig={}'.format(out_file),
-                              dot_config=dot_config, out_file='defconfig')
+                              dot_config=dot_config, out_file=out_file, **kw)
 
     def listnewconfig(self, dot_config=None):
         """Run listnewconfig.
diff --git a/scripts/kconfig/tests/warn_changed_input/__init__.py b/scripts/kconfig/tests/warn_changed_input/__init__.py
index a5f07d4a882c..17b602dd280e 100644
--- a/scripts/kconfig/tests/warn_changed_input/__init__.py
+++ b/scripts/kconfig/tests/warn_changed_input/__init__.py
@@ -15,17 +15,14 @@ def test(conf):
     assert conf.olddefconfig('config') == 0
     assert 'user-provided values changed by Kconfig' not in conf.stderr
 
-    assert conf._run_conf('--olddefconfig', dot_config='config',
-                          extra_env=warn_changed_input) == 0
+    assert conf.olddefconfig('config', extra_env=warn_changed_input) == 0
     assert conf.stderr_contains('expected_stderr')
     assert conf.config_matches('expected_config')
 
-    assert conf._run_conf('--olddefconfig', dot_config='config',
-                          extra_env=warn_changed_input, silent=True) == 0
+    assert conf.olddefconfig('config', extra_env=warn_changed_input,
+                             silent=True) == 0
     assert conf.stderr_contains('expected_stderr')
 
-    assert conf._run_conf('--savedefconfig=defconfig', dot_config='config',
-                          out_file='defconfig',
-                          extra_env=warn_changed_input) == 0
+    assert conf.savedefconfig('config', extra_env=warn_changed_input) == 0
     assert conf.stderr_contains('expected_stderr')
     assert conf.config_matches('expected_defconfig')

-- 
2.55.0

