Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA29452D2C3;
	Thu, 17 Sep 2026 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652329; cv=none; b=MRg/yrgolQiYkxytVzZyKK6UzU+8wXoY/qE+YuVtG8l2NWj5qFiMxj2Y2doSar4wr5Xl+HYe7fNgPV97DmR5iW3u2eCYM87yp4qECc/6ViPJcUxv0epRTqt0UJ0SjcMc+81d3M0VZbo2NkcWxDL4QAxLXmvhKF4JVpZ/nZLq2Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652329; c=relaxed/simple;
	bh=51VhDQtjIEEl7hsWIwr7rG2N14JprFPL7g1tLKUXLlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JB38payJLFcolav2zHCYnWFcuk3PWPXMCrZCXGWexcxHp6u1wmuMQxoGfM1tELobEI4CCE2/B3HWBH8C0gLQ+nf3SEnuhansXLeGGv+O0IaQy+jTIGRzjfK1onNcg+4NDQJFuxYG1PV/KK/BvLVP1uUiYGkItIoUre/W6iMuHQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=TibXBKs+; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="TibXBKs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789652308; bh=51VhDQtjIEEl7hsWIwr7rG2N14JprFPL7g1tLKUXLlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TibXBKs+T7KPiPeDg8INzARtnFHuFWe3Y8Tl4Im8wXKhl92R5bff5kLT6GzSxFtcg
	 cpdd8Ue0j9mnnehoIncSg4ytmh+HO7MxB4q+5qdjiRJNm7jvwMrY80L4sthqFs6fY6
	 d3LoVsHViHLgqPSuCoU2TTpniWsOhO9pVM0P4crp1Qzsct+U4PDt1lVM0Dflzav6NY
	 l5Wssiv0pzQt2SqqXGEBFXnfomxHEaEl2Ldeqg+jQXwZgWz3af9xelBh9PUtpRtmw2
	 zAZHwKIFif0/TTjTfMhZ1SQLY1jbd965BUrjCdSiHvo7xy5OKNxW/62USCs0I+K6pV
	 g/Q/Y9eXAzlzA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aabed54-ea3f-7f0000032729-7f00000194e6-1
	for <multiple-recipients>; Thu, 17 Sep 2026 15:38:28 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 15:38:28 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Thu, 17 Sep 2026 15:38:22 +0200
Subject: [PATCH 3/4] kconfig: tests: warn_changed_input: Simplify by
 reusing the extra env
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-kconfig-tests-minor-updates-v1-3-286e5c985244@fritz.com>
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=51VhDQtjIEEl7hsWIwr7rG2N14JprFPL7g1tLKUXLlQ=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqq+1Twl9Vhs/LWl7Lyd/PzPej4HXJDDoNvmI2+
 HwM1CImzkeJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCaqvtUwAKCRCIxryciJpt
 uLCxD/9ezthtWhRFJpeCxbX1YD+7Ix9uvBR3CG3J3TLcGOW+EezxXezHCmn+KZaQHqjIpqSuTPj
 FxwTz+/jlQWdCf+zfuJ904jIfM/b+G/GuRrmeznLNgIhNEZx621DfzhcHZiVXiXTvjO1CigoMmO
 c8H8SHDflm27hKyGkimxxqHR2QPUI2Jp54HR74HBkSAC1Zg3jYUttY1CKJpfDkfziTim0U3iq19
 7dQp/evIAJunh13a1YsqCb8L3YXwQQsQtrqOUQFQirreUXC6HHaxN/jFjinzR2uaSJaZPHifvix
 9symlBSQ5Ygs/u/vM0lU5qTv80PQuUy5SMgOa0U+LJzZy1yFq+b8ai8bMDczPiicNWGDYorrTv1
 tC/3PjdAqbG4sJZzwAA+uUph5dPZWH1hccYirq9p+0l+xNJviLfh1Thzqf5Sm7UB9G/1WLO32Hm
 2s5ylTFEdlDNY96c/fB/ts/fYeK7YD2/nLcGxmw4oyEvurOvXCvzyKGKVGF5vUf7yUlWMR2NLzV
 U+UQXmElre0cvT2wkikZuuwxixkcu56fBCHmVym0bZPkLdON9T1TtL/zdZFx9hH6yHE5+UH2oWF
 utdBaMY1QG8E62uljRT9HY35fyUlT3U0bkZnde5FnTvrwpJPHZiA9sBi+bLduXPIGf774j+5/qC
 hwqd2V6SAh+yGHQ==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1789652308-13CDB720-0361BA56/0/0
X-purgate-type: clean
X-purgate-size: 2068
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: E159EA0120  external: no

Define the extra environment once and re-use it for the respective
_run_conf() calls to increase readability.

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

