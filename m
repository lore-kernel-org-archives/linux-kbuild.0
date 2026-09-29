Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47C3A9DA5;
	Tue, 29 Sep 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668808; cv=none; b=cH9f6RYjDR77OO9HLDttuu57n0CjQxWklwC0RkIuCc2+D17ReCg8/PTV6Y2Xu4GVBtq214dNM/1hXEOPrXNj0FoDcDyv/VPlJ8sT3uVlVRZzVHMrg9NnEfKj5kgS5FZyEE1C88d8zeygk7lqZ8HmQISef0EaEXLGTNTrjmPJyGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668808; c=relaxed/simple;
	bh=bUOWFF3Z4iwYF3WKT2bhitwhVHqErb8fYexuialQNb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XvO5tpg8vI3pgD9VJi9TdczSe+YvsLRmT7QbD2FXgzLy/3gpgqUpQAcBmGoWa2jj3QgnonUwEryqz6idlZ8hOPwEhnHKxQzYa4+PS9cpxXYJbBVF1Tw27vNItZYgmOdknditXqmovGnXCyst9eZkqyZ+9J/KxOsx6AbNEAqguUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=KQ3sdGRu; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="KQ3sdGRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790668793; bh=bUOWFF3Z4iwYF3WKT2bhitwhVHqErb8fYexuialQNb0=;
	h=From:Subject:Date:To:Cc:From;
	b=KQ3sdGRuttcAk18J+k7+CjD6H8wTELJHvEOjYTXnbA+XsydYA9JKQ/w1fR4oOtgbF
	 yER5J4j9XqakZRscdXkR7Vsm+eAioJHuxA0XTOueENK2dC/8oWfx30FRYDd1Cxof7Q
	 p46Qktk0IPKi5aAqo2JNIXg8le1/w6QPbMbrIo+sPLnyEf0bOjuSmfkEE2XVOx23+Z
	 kJ3M2uVQ8uDPeK9giweSj+jkjGnPKvTGVJRB9uT9qGMrPbd6GnHBXrDgli8hibGhHo
	 4KQsdnPvGmvbtMaaL3NLHIHIsQctSJjsXRrzXLrpZTEJarqzYjyV/mDVtGOSmNY6i6
	 8R3zqMCfqtiiA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6abb6ff9-0449-7f0000032729-7f000001b7a2-1
	for <multiple-recipients>; Tue, 29 Sep 2026 09:59:53 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 29 Sep 2026 09:59:53 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Subject: [PATCH v2 0/4] kconfig: tests: Minor fixes and cleanups for
 warn_changed_input
Date: Tue, 29 Sep 2026 09:59:43 +0200
Message-Id: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSxKCMBBEr0LN2rGSyH/lPSwWEAccLQgmgfJT3
 N0IHsDlq+p+3W9wZJkclNEbLM3s2AwB1C4CfamHjpDPgUEJlYpCZnjTZmi5Q0/OO+x5MBan8Vw
 HRi3yTBaJ0GlbQzCMllp+rPZTtbGbmitp/1X+EpbuU5j1Wwya2hFq0/fsy2jO9ge0WsK3fWHnj
 X2uV2e5hv96NUsUqPKUEl3kiYrjY2vZv/ZhBKplWT4jQNBOBAEAAA==
X-Change-ID: 20260917-kconfig-tests-minor-updates-c0871950c6fa
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=bUOWFF3Z4iwYF3WKT2bhitwhVHqErb8fYexuialQNb0=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqu2/3O8tDt84ACr2U3bxI3UTmzXp/5IuAXeDAX
 f3LbNnGVpuJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCartv9wAKCRCIxryciJpt
 uH6vD/95F5cl8E06K1rFoHdgibVt0A/XacDs7ARSUx1lUY+WcrRrGErJ0J4PKhwRzk5ilNSd8eR
 LZeFCaTEMaH4XhRCrlIrmnws9611fpWcT2lrE5HhzqCtY5TZw3oSy5ugidzVayhoIc/LJfLXOQ/
 qtPY8zYQDiMsaPzI7ythnLP4Pq3JzAQ4o9b5aCInf/eTho0e0GrvLK9n2G4gxPUZN+t2ACWeG98
 MV7bd+UYHpqYfcNvKdEm3dWrLFreIh0qEag6O+nOScFnlyyZl7B12Ie6XdaFXD0An65aRTeE52L
 A1AkkSbzfXtKLNKOl0BLY6WUJhumlzOHt5lAP3LvAqAaRdKFjMZDXNtA3Jbs2CJG9OBijkFg4L/
 YpuLdnslmCCS5HtKZLaGSbzJvj1FoXw0fcNUbkY89Vu/ELKDQuSIbBVROCJ4F356xhrcky/vAxP
 1KXshYmiLQSS/A3+9/MBf6BWWS3Uj5b6fpND9BQxlGYQjTsFVKAwaV7UNBCdqKKffuVzXvsb4CJ
 Gjnr8ZKZnb9LuEpCSPhsPDG5pr7+YYvmcHt8ih420BTpSzhsNxqp9GfhhX9oM8/wdBO0mgvfNuu
 6QcfqgVl9H0SsyFaEqijf32MjLZF5sd7Vt3lIo0V7Lsv+mCvtp8epWZHauBRlZVL0ElOcH8odm2
 CwstOsU/rcazQ7g==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790668793-40FE7965-74C6EB96/0/0
X-purgate-type: clean
X-purgate-size: 2074
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 61B57A07CB  external: no

This patch-set contains two minor fixes and some related cleanup for the
warn_changed_input test:

  * The kconfig test 'warn_changed_input' fails if the environment
    variable KCONFIG_WARN_CHANGED_INPUT is set non-empty.  The first
    patch resets all environment variables with names starting with
    KCONFIG_ by default for all tests to make the kconfig tests more
    stable.

  * The kconfig test framework provides 'olddefconfig' and
    'savedefconfig' wrappers, which fail short when it comes to real
    usage.  The 'warn_changed_input' worked-around by calling the
    framework-internal '_run_conf' function.  The remaining three
    patches extend 'olddefconfig' and 'savedefconfig' wrappers and
    simplify 'warn_changed_input' appropriately.

Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
Changes in v2:
  * Reset all KCONFIG_* env variables, not just
    KCONFIG_WARN_CHANGED_INPUT (Julian, Nathan)
  * Link to v1: https://patch.msgid.link/20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com

To: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Ulf Magnusson <ulfalizer@gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Nicolas Schier (4):
      kconfig: tests: Reset all KCONFIG_* env variables by default
      kconfig: tests: Provide defconfig outfile for savedefconfig
      kconfig: tests: warn_changed_input: Simplify by reusing the extra env
      kconfig: tests: {old,save}defconfig: Forward dynamic keyword arguments

 scripts/kconfig/tests/conftest.py                   | 21 +++++++++++++--------
 .../kconfig/tests/warn_changed_input/__init__.py    | 21 ++++++++-------------
 2 files changed, 21 insertions(+), 21 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260917-kconfig-tests-minor-updates-c0871950c6fa

Best regards,
--  
Nicolas

