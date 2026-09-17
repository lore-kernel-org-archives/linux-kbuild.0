Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B614CDA22;
	Thu, 17 Sep 2026 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652331; cv=none; b=nlb97RHn7uZzAJNzs7/Ej/xHcW148tVdhT6ux2KskjD+cLDlXBSI1aE+lOexSjCyZaZs1AfEUh8Y0HdkjtBK7Ci8+KUsbaKeW48nLX/mPJTuL49ncAPlsmSMhpTDZJgdKx9L7uAlnFWbS8mkP+SdFcDnMtxIuoYSHPs0q8dWms0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652331; c=relaxed/simple;
	bh=MkmZivRz+Y1reyk/vNcZv8GKUXwiGfCnUV1KMtTCdrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5+4vY4/BaAJ1P4a0/1+L4jdyDsbvEBU12xtKemEUPvGyNQRcoAUMpHP7c1nLa+teO4mGSKtDrxIibG5qFRUxAyE+b1dhRYapkQJrtPPc0z+LBEgI++v8iH0N/auXy/ZYSLj+gBy75B+Ooy75x2J5k3l/KmiLvHlaxLApjDT6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=S7q4EYc1; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="S7q4EYc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789652308; bh=MkmZivRz+Y1reyk/vNcZv8GKUXwiGfCnUV1KMtTCdrg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S7q4EYc1KKV3YkbsYFx4OXRmPBm5ktAyXXY5dmz9ZF7WoWEO8SXww9/E4jGYJ67oX
	 M+4e0aP9lE0O0ws1yp+vLzlwmX0mCKefzWE48jGumQbZ/3Tb+NwRnpyNJBuMNfa2PQ
	 habnd5rWRuqsD/v6hAjDGRSbXtdGNAnfvdTZiyGNYH/OCaDO7YWWqZSeSdfieH31jZ
	 cdxJefe5MM89Ue4/nOv4cDDeAARwFzZcBfnuYW8RvMijdH79TxG9beQJf6U8yzcGGG
	 aYbkA4UDxnU/ZOXhVslZtAg52bc0VY5MHr6Z5nbH3dV61rhbvrmL3c0h/4twswI5wo
	 UStZqO2W33EYw==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aabed54-0449-7f0000032729-7f000001ea3a-1
	for <multiple-recipients>; Thu, 17 Sep 2026 15:38:28 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 15:38:28 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Thu, 17 Sep 2026 15:38:21 +0200
Subject: [PATCH 2/4] kconfig: tests: Provide defconfig outfile for
 savedefconfig
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-kconfig-tests-minor-updates-v1-2-286e5c985244@fritz.com>
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Ulf Magnusson <ulfalizer@gmail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=MkmZivRz+Y1reyk/vNcZv8GKUXwiGfCnUV1KMtTCdrg=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqq+1T8HBM3BC1m99graodE4hBbVkpSVTF/EHQK
 skJa8H7e7GJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCaqvtUwAKCRCIxryciJpt
 uF08EACcNtqzd7LMf5rwDYHDeE6juXrBzmOpf545DMnOykc1oZXusLl+xmlJzOrBdAbKxgSjkFZ
 7Hqh8W95jvvj+ceOpWK0C5qxc4QAXh9oJ2Vz0lDZt7GB8yhzV7iYgYWEhLulqpCOL2QrXIt92fJ
 1ZLEFizxD80WQD+T4djoZnG8TyaZEwBOYlE19sA6IdOJX5FB9GZaegCJbFwhYsl9sw82NoUPWnB
 rir5K2xka+p9Gt2B0y+5sGSCnUMseCNHk59xawOccZTmRyadXdFd3I0+G1emiQpYNIt/BsKyY6D
 m1guABgz6IQF/naqRAB9vYlY8PAApCXjiZpLlqBXIv/Moz8e7/X048kvKo+j1VlfBDZaV/FFzhh
 6AUGAjm6qlz4mLEt7y1tFz0I4KnftpNJmdS6u7nwAhAzRJNMouX+XEX+48VUOl+AX0RJ3yyUOUd
 aVMhmUVINt6fBTRIv8DmVXMe32Ew731mTuar2JrAEVsy37zK6tHfU4Fz9/FtuzVuwLewtZafR6+
 WFjVCzOSalrfyD5xAeRj0g9Sw3tcepAZ+KxlU7BCBDoYvEZUwgy6eYerYNIY2yhVUcaAhVgMkVL
 veyDyHwrcX+cMLxlv1M/q1jWPewPmDurkocyy2hFF1bhUuXMdwlPrRPbdZtBxQBMNrLfeMcd5Fm
 /R/K5PGjv9/WAsg==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1789652308-47FF5965-10781031/0/0
X-purgate-type: clean
X-purgate-size: 1250
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: A4639A07DA  external: no

Let kconfig test framework's 'savedefconfig' forward the requested
output 'defconfig' filename to 'conf'.

The original implementation was calling 'conf' with '--savedefconfig'
but missed the mandatory filename for the defconfig output file.

While at it, honour the 'dot_config' argument which points to the input
config file.

Fixes: 022a4bf6b59d ("kconfig: tests: add framework for Kconfig unit testing")
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
 scripts/kconfig/tests/conftest.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index e92f0cf1421a..f2ad2ac2a661 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -240,7 +240,8 @@ class Conf:
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

