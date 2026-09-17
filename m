Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925A5328DB;
	Thu, 17 Sep 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652325; cv=none; b=qdvAB+CxHgFmGyWpaiIA5tbM7RFCbf9dCG/BqeoA1sMCgC4xNuXRDLRNaLFJyQkKhcE5Y8yZEP4l35jOE+wIuVbpXlU1j2U27y/nqTxN8kQQwZ2GSXeRYcU8FgzkgDJRELFlxrKZ9f+NpL1FLWF0RbGWY4lxwTYHlDGADeCZBL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652325; c=relaxed/simple;
	bh=TlCIWvO/3nlTXoPr2tSt48vCKxojQ+eDnpamG1dNUZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qAGkNMw7ayQAP68OxyFBli2n0F8DxGJkiiTEAdHlGF9nBWvkQA2CmZ2KRC8HgEaF/XlTawbCtlTBYmzUKnpL2Q0VHNXwA9vGAmF47EPC4UuOR77dLziTSvjp8BnUrn+4AjejWyLIjRDOZPynT+8kyPG75f13t2NtOwdVBgxxQPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=Pfwvu8Oi; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="Pfwvu8Oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789652308; bh=TlCIWvO/3nlTXoPr2tSt48vCKxojQ+eDnpamG1dNUZI=;
	h=From:Subject:Date:To:Cc:From;
	b=Pfwvu8Oi8W8vL84PipLc+N+9lYYhSVlq7dxt5jl+jRycqxhajcQIp7pstJXIkr3ui
	 REYm/MqQwHebhQH8OhBTKI7esbzg18LLw9KkDMhFFO2Qt4D6l/0S0hiI1z+TObgW4D
	 EwV17330rp0STgdv3rBN/7N9P4uehsbhjwwyOVKw+bK4fFtjV65p57W83y2zE9QKri
	 EZBLiJOUl8tSl1dXXffEu2BYoeNOB5ooA5NNkjxwQJlHf15O/NJYlWysIVia71s+RO
	 v8KvQ0e8CEK2lcPjlTD6St+0KAar4fz2MW0O/BQX6pIBK5Dtpw5Ax4UNGc8I60SYSS
	 Azbe5DRV1cdmA==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aabed54-ea3f-7f0000032729-7f00000194d6-1
	for <multiple-recipients>; Thu, 17 Sep 2026 15:38:28 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 15:38:28 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Subject: [PATCH 0/4] kconfig: tests: Minor fixes and cleanups for
 warn_changed_input
Date: Thu, 17 Sep 2026 15:38:19 +0200
Message-Id: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3NQQ6CMBCF4auQWTumkEiFqxgWpQw4mrbYKcSEc
 HeruPySl/9tIBSZBNpig0grCwefUZ4KsHfjJ0IesqFSVa2aUuPTBj/yhIkkCTr2IeIyDyYbrbr
 qsrkoW48GcmGONPL7V791h2XpH2TTN/lfRHot+TYdM+iNENrgHKe2WPW5gm7fP/gt5M2nAAAA
X-Change-ID: 20260917-kconfig-tests-minor-updates-c0871950c6fa
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=TlCIWvO/3nlTXoPr2tSt48vCKxojQ+eDnpamG1dNUZI=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqq+1Ssy1DhyFHgdXBdBYz8quJ3vMGNJB3YE/V6
 KCyhgOmEGqJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCaqvtUgAKCRCIxryciJpt
 uOpaD/9zPTN74TpCu4hpumFiRd19MxsuV9fQyAcS5N+450QEGY7YHGml4WqmBPa8jM72ar9D64e
 /+uCkbFnuDFk3IlnkqYW4ZMO1L67dogW7UUNa1CEdJ5bLIR9NJfcEwwKuNrKE6Isyb316Bg391t
 hyDlSnnpnQWl9QqssXre+vlc0EarvWriMVAj1LZnpSy+GePMVFkwVf2utgJZQRSKcp0EYbhyivx
 RN9OL9m+9+mVCNOxd2C6/Tw79QHwq42mFXxtTjSCWkkbf7cS0gepb9XbdyVETH4Ma++CXFUUXev
 JALjlwkv79NpU6Ui5g9qckhhrmUmHGvW0m8oNktpU9NlOmLq5NLrd3g2CeM3w0ZomTSEUR1mt3A
 uY1Hb9LaFOO5ixCPElcT0FLdzeWaLBDoM5FP1A0F7tLw4mWUE5hgGvDEQPOCEJLloO3Xdr/R8yJ
 MxOD0oW2cZpZD/7pZQDMbpsWWPfto4sNV2JtJ0VZuxF9KBLM6Vz8cm1G5N7jdMm+2Xa2TgT8NYG
 Zp+O61bmG2r7NPFDEc/nOFoCKB6xskkYdhwEiGuEthmUshNsYJZd15UThfDgPwPL+T1/HQWBM2n
 1SY/YTch9o/+uQEsPukDsDWsMi+GgO5swxAhRWaL7h8vv6arvPvriOO09vb23Aj9Sx7KvKAK/ro
 mylkWzsXzziQ4WA==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1789652308-0ECE5720-FB0020E1/0/0
X-purgate-type: clean
X-purgate-size: 1496
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: B86ADA0122  external: no

This patch-set contains two minor fixes and some related cleanup for the
warn_changed_input test:

  * The kconfig test 'warn_changed_input' fails if the environment
    variable KCONFIG_WARN_CHANGED_INPUT is set non-empty.  The first
    patch resets KCONFIG_WARN_CHANGED_INPUT by default for all tests
    to make the 'warn_changed_input' test more stable.

  * The kconfig test framework provides 'olddefconfig' and
    'savedefconfig' wrappers, which fail short when it comes to real
    usage.  The 'warn_changed_input' worked-around by calling the
    framework-internal '_run_conf' function.  The remaining three
    patches extend 'olddefconfig' and 'savedefconfig' wrappers and
    simplify 'warn_changed_input' appropriately.

Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
Nicolas Schier (4):
      kconfig: tests: Reset KCONFIG_WARN_CHANGED_INPUT by default
      kconfig: tests: Provide defconfig outfile for savedefconfig
      kconfig: tests: warn_changed_input: Simplify by reusing the extra env
      kconfig: tests: {old,save}defconfig: Forward dynamic keyword arguments

 scripts/kconfig/tests/conftest.py                   | 18 ++++++++++++++----
 .../kconfig/tests/warn_changed_input/__init__.py    | 21 ++++++++-------------
 2 files changed, 22 insertions(+), 17 deletions(-)
---
base-commit: 237a1c39e8dfd3e1c6f1f023eea37a48ec04cc63
change-id: 20260917-kconfig-tests-minor-updates-c0871950c6fa

Best regards,
--  
Nicolas Schier

