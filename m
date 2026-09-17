Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E773153CA78;
	Thu, 17 Sep 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652326; cv=none; b=Mxh2MFurMVmC40Z3pLxANMq5I9GQpWxo1SAs1p+KxUGnDqP6PmySP4gkshfq5qUeXO9t23agh69Pogn3LLKzpkIgijlT78KiYQcSC6eoMJfrYuqNJi8Z4xp8hH8/3VH82FFS+Tyye1qJSK1fCeUAQXCkfia8hwzP9uV9u3lQg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652326; c=relaxed/simple;
	bh=18bboVVYANVVPxixRiNqUX5SyVaRRHU6R4RydjWMN+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHzKqk1rOAHVxUIxdZvMIw8BNmE6CENu9mZbaTpB8yhKjfsGOJHhZJPElmx1kQDackxyYKXOmA2PJiJNLCv8SUzAHKhyrUvzplxk9Wsve9OZ+LyjBxSoher3geBO0n5DkZjI5TVp4vSjvEvSN+OJr5B+Ye+7yEN/mys58Pr3vb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=SWQxByKm; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="SWQxByKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789652309; bh=18bboVVYANVVPxixRiNqUX5SyVaRRHU6R4RydjWMN+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SWQxByKmuG8oPVTlpe9uOiNh1pM/LO91qkUF5uP6LGZLjI1b4H3mXV9vrz1mmeP1W
	 NtZGSttqug063vsTtsXKsPW8xIsHxSDkerbMwCwXp/ImRxSss/+kXSJhf5mxR0/+9k
	 GXfajcDxcpsVyPfOOMJykhKObBCCqYc+yxz8/F51790kgoBpaUm7X9PoP+63rtkGJ8
	 oJBRPvw2AfdGFXJCTBN8Pa5XYFYa1aOnrTVdf3Tjx9sJoX8Q19vaK5+ZCSAjVthkJJ
	 jvw+4T44VGabkTflTl8cS90EyQzbs1Zl13ouBgZOrCxMngzDWw3dkWUgwgIy03fBSi
	 flGvRQHHjXnmA==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aabed54-ea3f-7f0000032729-7f00000194ea-1
	for <multiple-recipients>; Thu, 17 Sep 2026 15:38:28 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 15:38:28 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Thu, 17 Sep 2026 15:38:23 +0200
Subject: [PATCH 4/4] kconfig: tests: {old,save}defconfig: Forward dynamic
 keyword arguments
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-kconfig-tests-minor-updates-v1-4-286e5c985244@fritz.com>
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=18bboVVYANVVPxixRiNqUX5SyVaRRHU6R4RydjWMN+Q=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqq+1T24IdVJsrIKcgIWO3qRYQl4HTSKq8IYc6K
 uOpEpVeBD+JAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCaqvtUwAKCRCIxryciJpt
 uB9sD/0aN99gIjtowHOYLeTw3NKyW4TfecM3fvV5rcRDQigcD8E4FMf/S9rpSZ8yqvcIj3hXy2C
 u+BC0+wyLG36OPgiDfqLL5S/QyzH9zq7g2xhDps3tDn3nSClKx91YwxJpSPLH1mWb86uGAtfWia
 kAB+Rv4GXosun1oDd9KMJAHxjSdRHw8mmrCfyUXDw1eGseW8kVp5+vP+JX+G/AgvUwS0BJOPHQA
 IkPvfx/tdvcDXzWhZagOG4LDRFKkRxHY9KJDc4ODnO/0x/jacURYw6YrGDjPVPrQfWktAj9WOMk
 goWqyor1SexrRFs59/WSndezQG/m/kYFpXrfKBEtCryLLozXTh95aIPn1j7CtDqWqfVpENTFjom
 UPYOn5eoIwsL7aYhzBYQNdTEJjQpa0JyGAJck131zCE5OT6sY5pWe3GoK7/gKpzCVTYq7HvwET5
 Mjg0zQMKnpr3DJj7YrrS6XxeXCDbe9tMZwpw9mSBcC3WzFq7+dZRDMWGgJeWvTsdZ2tgJ+uW6UU
 txuONoD6RBlDOkBy24AoVst31HoHAu1KFe29+WCgcibCogc2YMiNV4HjVNnDpSAogpO2dPTaz0z
 u/TDmkQQTTcMssOYATLNGwq7j18xuRg03nQnWQIjMq5Hm0aCwODxPX7MPgB5BL1vXfD/Ir5XjgN
 G7amLrvRS8kuaVQ==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1789652308-F3C9B720-656E5E58/0/0
X-purgate-type: clean
X-purgate-size: 3808
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 21D31A0494  external: no

Let kconfig test framework forward dynamic keyword arguments for
'olddefconfig' and 'savedefconfig' and update the _run_conf() calls in
warn_changed_input to use the corrsponding wrappers instead.

The warn_changed_input test needed to use _run_conf() as the
{old,save}defconfig wrapper did not provide the necessary flexibility
for common calls.  With dynamic keyword arguments, there is no need to
use the framework-internal _run_conf() any more.

Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
 scripts/kconfig/tests/conftest.py                    |  9 +++++----
 scripts/kconfig/tests/warn_changed_input/__init__.py | 11 ++++-------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index f2ad2ac2a661..84a6ad9fd2f7 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -164,13 +164,13 @@ class Conf:
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
@@ -234,14 +234,15 @@ class Conf:
 
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

