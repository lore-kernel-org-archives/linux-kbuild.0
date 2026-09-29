Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A8F3AEF53;
	Tue, 29 Sep 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668809; cv=none; b=RUkpqel8I2KApckWFz9SWmTbIX9YkLw2YOh7zZEBpioYrYMh7QtiW4F2fVKJpw6E052IOWzONLKoXv8kFPyFqxJqA2+mFJX7OV4V2FlVhkRp4SZQ8b5LnMeBHnsbHA955lvnOOY17T7YbNIoWwgl+t2eCj333YrVZzveZe4Ta1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668809; c=relaxed/simple;
	bh=/oOupoI4p7ZHPmkJr05w8DX7IqoNu5ZAZ0M2wskJXiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3uBPSTLtLsQ0Sfsmp8LMzNgvG5v2scBpKLIKnslXZRBZdujavas3la4Zc1MNynGXjMKeFzaozEYe826cpvLRJg2SiTbutY9sJEHYPBB2zTu2Vs4d89iTTUOaQrXvDbEbeCO5qiCZgWA319eJI15CAsirJl0vAYDWe2/UpHLKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=Mtj5cb4t; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="Mtj5cb4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790668793; bh=/oOupoI4p7ZHPmkJr05w8DX7IqoNu5ZAZ0M2wskJXiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mtj5cb4tQCa+2gl95IzKKyVpChaicJS+s0UqrKmOxwS2bJD2H23MRSg1uas26b3FC
	 nB5819CWseq+q6R4B+9DEsxky1z5o5pCcE7472o1csG6D2K2lDh1YoN0tkiG9lL2Y5
	 g8IOsww0VlYRSviatl0lmpp4FBwS5/ce2U4OI8eF1Evfs4M1ZGsbvl1pBnCi6hxjB9
	 JPpfBe9LiLMHtmDgRke14yrf+N55Hzuoq0WHdLdva2nS/cwGX7Z3vzTF4WB/4qtHJS
	 AdvauQ6R9syXUWFTANDRadpK8vU5OODJnuJ47y9uxxNnDAAZNKleP3qYTMGy7AbOiL
	 q2QGbQlwt0njQ==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6abb6ff9-0449-7f0000032729-7f000001b798-1
	for <multiple-recipients>; Tue, 29 Sep 2026 09:59:53 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 29 Sep 2026 09:59:53 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Tue, 29 Sep 2026 09:59:45 +0200
Subject: [PATCH v2 2/4] kconfig: tests: Provide defconfig outfile for
 savedefconfig
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kconfig-tests-minor-updates-v2-2-c5902bee1d0c@fritz.com>
References: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
In-Reply-To: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=/oOupoI4p7ZHPmkJr05w8DX7IqoNu5ZAZ0M2wskJXiA=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqu2/4wb71IwFng+CNUDK94/pQYUBk5igJlnV3h
 XgprlYSWD2JAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCartv+AAKCRCIxryciJpt
 uAWjEACOXCmpPx6E7xNk0INv1qOexZrCT0TFCL65NCQ+uettQs9M06ON5r2oTmvavg6Py01SV8T
 6O5BR5yw3DeOLWtjHgQ1r1wxYzU7mklqtT/u6rByjIyY7eLpToZd6IdSYp5IoF21VywTSuhgu7b
 NDx6HgLlCJC1yYcQVrylAtb3lB63i0lVdY8WjD/VowP7LZOEjTA+B95cOKlLAxWwo+QquH7fsET
 /Bl7amRl+a6xmnnOSnjRaSb8zLrTNgYKEkXNJCJvlexyyM8mcaAVzvamfETbYWA721EEOjJnGRo
 qUYAx8BnlIMyMEOHIDfU7Z1dSPKXBwCC9ndz0GfDq9CldciD3WZUkkChtOB3y6Fut3CGgm45ypn
 jlz9pqpAwScCIgVvRfGcsqtQttOAL/2adjEHb/tKYshLcV+TxfLVe6wiD6ZbgkhSxHsR8zajkuO
 ojaX1DVFsH4L82+M8VBp62Q8Mw/YXMfngp2AwPKSQJQmKuMSxG9pR1BV2+fQHrgX7fkbufKGbqo
 cfpEgtBz/+w24kQPx0aqdJDN+QFt4sB+jqWpskhp6amo/4W/U+CFqPmBvPBIf5tFu3ZuIAsSNok
 6Mq2jaNT7JB1GHbQ9RZbku+GFMmtJg40L2YguIUetf/e29JL0pGm4X5fYTdvznQj0IzTCsPNEus
 sQ0IGlrvJ/miGGg==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790668793-21FB9965-967B6A19/0/0
X-purgate-type: clean
X-purgate-size: 1301
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 4936BA07B9  external: no

Let kconfig test framework's 'savedefconfig' forward the requested
output 'defconfig' filename to 'conf'.

The original implementation was calling 'conf' with '--savedefconfig'
but missed the mandatory filename for the defconfig output file.

While at it, honour the 'dot_config' argument which points to the input
config file.

Fixes: 022a4bf6b59d ("kconfig: tests: add framework for Kconfig unit testing")
Reviewed-by: Julian Braha <julianbraha@gmail.com>
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
 scripts/kconfig/tests/conftest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index de8e555cd951..b2539e51e2a6 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -235,7 +235,8 @@ class Conf:
         dot_config: .config file for input
         returncode: exit status of the Kconfig executable
         """
-        return self._run_conf('--savedefconfig', out_file='defconfig')
+        return self._run_conf('--savedefconfig={}'.format(out_file),
+                              dot_config=dot_config, out_file='defconfig')
 
     def listnewconfig(self, dot_config=None):
         """Run listnewconfig.

-- 
2.55.0

