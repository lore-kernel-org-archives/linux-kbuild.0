Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096839;
	b=TUL1THirG0QRxhyV2pxvEQovQUh7pbSvdzP/UuHPEU9rHlQFEwEx7U1vyiSJXh+CxMbp
	 6xa8PsOWbPqNfmnAFyZNUTsbHDNscmvnOwZ7w+5FpDmzF4gcFYxn2iQATkPo9+7/rFsgw
	 nhqvdCFbBhzo08udikLIZpfBSni5zAmzamvAZMVPmtWYSa00DiVCitpp7PvV6lTJaTMJw
	 HTgsEOPJFmdvI1hBpUdzaZdRYnpOaxy40IqzFK8vyFkjqrJQ4FJi8mgQjiry5GbNC+2ap
	 +1Z8K7z9Tg8T2PZ1pN0kxvwIdAFwNnRCR/knb79sveOg32HyK3uvIojP4p9X8XkNFug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JKXq1V45eXpdnFE99wshQ3bHYsTOtcliwsEgfWaRprg=;
	b=zXGIJcAWO1r7DhiP0dIQL99y9n35nNTU6e2Bglr5xX1PtVSqAA2MskXWsh5SHbKAUDmm
	 VhTc2z2lMVFIWuLmlEfXQk2BGnz3nnNF6EX2UR2Je0dY+yERC0d5mVGgkfog1+PWvb/Hj
	 rLukBOsfeiAX6GvftmmRfQwuUq8ZuUFh/Vm8tehHga2zw7/eWyJg8smavm2QBW2TxQXc1
	 xuTAy52d8jypF2x0PmNvW6bjNn5uRoYgDnealqMeZJwoikotbFe+Bovdx+85BqpR9bVps
	 FYzUXXPxWU72J/9vWHhfRGFv+gZJCDWhJXe7Oc21jSiJ7cKj9tNwm1J89Irn5qghYKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KwfSoBgJ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4D2606A31B
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2026 10:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4D2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KwfSoBgJ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so28075235e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2026 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096837; x=1793701637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKXq1V45eXpdnFE99wshQ3bHYsTOtcliwsEgfWaRprg=;
        b=KwfSoBgJft6tDq6bXl+I5s7oQzeSBaTjSZAzm4e1+cTnSQvGCCltKuw8kQLP8W/4tX
         SOeLqLr7dYv6V/+EiNO6K4NqiYAjCLgwKbZk0lo+ran5L2CtUudsQJwN16x3cZTgEqfT
         VPjKNJcfaztufn3gknvdePZuNRiiAtS4pz8GXsWQMFQhyEUvFcpgDGoKulaTfmZ0NTx5
         7E2tq871cw2bCdwy1+C62xHNCDHqoCqokpu0TyOITcabNumsfApaz5/FPJCEpN9rQwmz
         VIWmk5iPc5Fx9K90Aw3reM35yrJwm9IscqMy3naAWakXapnQtLYugO/8vj3UbKzm4NNU
         dlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096837; x=1793701637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKXq1V45eXpdnFE99wshQ3bHYsTOtcliwsEgfWaRprg=;
        b=hfQqru49+ZMvawpYUu/Ni5UYZPLZk3rq+IojVJA86hYAnan+I/qZVfQy4SzQxTRiIb
         J80WUH2sw4ku+b5ZD/Vt0ziWCovn9M40X3E3PZM0ZBgocU6FQLt1n2NpiKaztUqaP+Bi
         6yxOHoiGdiYHIM1NJMsxvPy4W5NIM7aaS4FqwPGaSIkKP2vdqZCJW+nXkyy/GsR+Csv0
         ExetfVQ37wSylAlWFRStbbYZaYTsLJ/H+n70DnHkYmKV8btDFqGm2eXuwybijmk4rp7+
         UtxavPu/aIVLwRdCxE5JfOgjB8DSl6223lSYXNPCNB5azzN92zJtq1WCah52TqzNjFYu
         9w6Q==
X-Gm-Message-State: AFq9FYJpIaruAuRHSDRqUcx/Sj2JAYNra9S/sjp9PItilmEccW04p6EE
	NPi2VX8ShJ9fthp96LSiiWZHWIbLLk1+qrdT1COvJQZaO08Y94SLxrYy
X-Gm-Gg: AYBFou2OuEzv1WizZljfq5q7+C2QBc6DF1pDxIMEiWelcLuQJDDPbFIeMiyxU8+IC9r
	sOebf9E80EZZrC/cLjIAx+zZ/j36zzqGzqv/x1PkFyGpJm0/xKuY1o43bJN4oS2rWrifXbJXrTv
	4MSJt3IrXj9wBlL9WRJqVmpTF8RubAxEPV278UD0RauJZgEf1B3hXi4OOG9vPNoTgqu/B5j2Qca
	6WCCxbvOWFPahrFhb7pp7JuTQs+HKVPt9RBlF0WgZarIeIfTBaKDIrJupbbykqhB18GgVSiBfBO
	kh7U5o2cqn/La8hVFsg1J/ZGx85BlgGUQkkQq7dQvYbrlVhNgAlSg1fWTRlMr1suO2LYoeSz6QN
	fCyYa7EfZzha+GjuXn5MPpvsUiuB9QLiaxUlZN05+Utr8dpoqgFsHIPb+uCujOhZ0ocxFO3j7cL
	JlfRPtuqhHhaIQ/pe/4ef+6rPPxb4MQPWcQgiX4Aaf7ZeyaEDJYjZQYLV1F5Wum7gjDKLFE4hXP
	FXeRTH88mZRbiKd/+4nK20Dtfc2WY7//NbrakiqR5R2MgyBQwkhwla16v0NmCaLFI14cLEe2GOB
	E0w=
X-Received: by 2002:a05:600c:6612:b0:4a8:c6a0:c08f with SMTP id 5b1f17b1804b1-4a8c6a0c4bemr5634875e9.35.1793096837300;
        Tue, 27 Oct 2026 03:27:17 -0700 (PDT)
Received: from fedora.home ([2a01:110f:1ce1:e800:f148:be2f:d25d:95a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a293sm255806045e9.12.2026.10.27.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:27:16 -0700 (PDT)
From: Vladimir Gorsunov <gorsunov@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Vladimir Gorsunov <gorsunov@gmail.com>
Subject: [PATCH] scripts/tags.sh: fix Kconfig indexing when using etags from emacs package
Date: Tue, 27 Oct 2026 11:25:42 +0100
Message-ID: <20261027102543.22151-1-gorsunov@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'+' and '?' operators in regular expressions are handled differently
in Universal/Exuberant ctags and emacs. In emacs, + and ? are
operators, and \+ and \? are literals. In Universal, it's the
reverse

Replace \+ with an interval the same way \? is handled already

Signed-off-by: Vladimir Gorsunov <gorsunov@gmail.com>
---

 Hello, my first attempt to contribute something here. If anyone
 could test, you need Emacs >= 31.0, because character classes
 (:alnum: etc.) did not work in etags since 27.0 due to a bug

 scripts/tags.sh | 45 +++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 41e38df96984..ce2fa0ef5910 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -162,6 +162,7 @@ dogtags()
 # the following limitations:
 # - No regex modifiers
 # - Use \{0,1\} instead of \?, because etags expects an unescaped ?
+# - Use \{1,\} instead of \+, because etags expects an unescaped +
 # - \s is not working with etags, use a space or [ \t]
 # - \w works, but does not match underscores in etags
 # - etags regular expressions have to match at the start of a line;
@@ -212,8 +213,8 @@ regex_c=(
 	'/\<DEFINE_\(RT_MUTEX\|MUTEX\|SEMAPHORE\|SPINLOCK\)([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\<DEFINE_\(RAW_SPINLOCK\|RWLOCK\|SEQLOCK\)([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\<DEFINE_TIMER(\([^,)]*\),/\1/'
-	'/\<DECLARE_\(RWSEM\|COMPLETION\)([[:space:]]*\([[:alnum:]_]\+\)/\2/v/'
-	'/\<DECLARE_BITMAP([[:space:]]*\([[:alnum:]_]\+\)/\1/v/'
+	'/\<DECLARE_\(RWSEM\|COMPLETION\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/\2/v/'
+	'/\<DECLARE_BITMAP([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/v/'
 	'/\(^\|\s\)\(\|L\|H\)LIST_HEAD([[:space:]]*\([[:alnum:]_]*\)/\3/v/'
 	'/\(^\|\s\)RADIX_TREE([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\<DEFINE_PER_CPU([^,]*,[[:space:]]*\([[:alnum:]_]*\)/\1/v/'
@@ -223,31 +224,31 @@ regex_c=(
 	'/\(^\s\)OFFSET([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\(^\s\)DEFINE([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
 	'/\<\(DEFINE\|DECLARE\)_HASHTABLE([[:space:]]*\([[:alnum:]_]*\)/\2/v/'
-	'/\<DEFINE_ID\(R\|A\)([[:space:]]*\([[:alnum:]_]\+\)/\2/'
-	'/\<DEFINE_WD_CLASS([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<ATOMIC_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<RAW_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<DECLARE_FAULT_ATTR([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<BLOCKING_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/\<DEVICE_ATTR_\(RW\|RO\|WO\)([[:space:]]*\([[:alnum:]_]\+\)/dev_attr_\2/'
-	'/\<DRIVER_ATTR_\(RW\|RO\|WO\)([[:space:]]*\([[:alnum:]_]\+\)/driver_attr_\2/'
-	'/\<\(DEFINE\|DECLARE\)_STATIC_KEY_\(TRUE\|FALSE\)\(\|_RO\)([[:space:]]*\([[:alnum:]_]\+\)/\4/'
+	'/\<DEFINE_ID\(R\|A\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/\2/'
+	'/\<DEFINE_WD_CLASS([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<ATOMIC_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<RAW_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<DECLARE_FAULT_ATTR([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<BLOCKING_NOTIFIER_HEAD([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/\<DEVICE_ATTR_\(RW\|RO\|WO\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/dev_attr_\2/'
+	'/\<DRIVER_ATTR_\(RW\|RO\|WO\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/driver_attr_\2/'
+	'/\<\(DEFINE\|DECLARE\)_STATIC_KEY_\(TRUE\|FALSE\)\(\|_RO\)([[:space:]]*\([[:alnum:]_]\{1,\}\)/\4/'
 	'/^SEQCOUNT_LOCKTYPE(\([^,]*\),[[:space:]]*\([^,]*\),[^)]*)/seqcount_\2_t/'
 	'/^SEQCOUNT_LOCKTYPE(\([^,]*\),[[:space:]]*\([^,]*\),[^)]*)/seqcount_\2_init/'
-	'/^\<DECLARE_IDTENTRY[[:alnum:]_]*([^,)]*,[[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/^\<DEFINE_IDTENTRY[[:alnum:]_]*([[:space:]]*\([[:alnum:]_]\+\)/\1/'
-	'/^\<DEFINE_FREE(\([[:alnum:]_]\+\)/cleanup_\1/'
-	'/^\<DEFINE_CLASS(\([[:alnum:]_]\+\)/class_\1/'
-	'/^\<EXTEND_CLASS(\([[:alnum:]_]\+\),[[:space:]]*\([[:alnum:]_]\+\)/class_\1\2/'
-	'/^\<DEFINE_GUARD(\([[:alnum:]_]\+\)/class_\1/'
-	'/^\<DEFINE_GUARD_COND(\([[:alnum:]_]\+\),[[:space:]]*\([[:alnum:]_]\+\)/class_\1\2/'
-	'/^\<DEFINE_LOCK_GUARD_[[:digit:]](\([[:alnum:]_]\+\)/class_\1/'
-	'/^\<DEFINE_LOCK_GUARD_[[:digit:]]_COND(\([[:alnum:]_]\+\),[[:space:]]*\([[:alnum:]_]\+\)/class_\1\2/'
+	'/^\<DECLARE_IDTENTRY[[:alnum:]_]*([^,)]*,[[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/^\<DEFINE_IDTENTRY[[:alnum:]_]*([[:space:]]*\([[:alnum:]_]\{1,\}\)/\1/'
+	'/^\<DEFINE_FREE(\([[:alnum:]_]\{1,\}\)/cleanup_\1/'
+	'/^\<DEFINE_CLASS(\([[:alnum:]_]\{1,\}\)/class_\1/'
+	'/^\<EXTEND_CLASS(\([[:alnum:]_]\{1,\}\),[[:space:]]*\([[:alnum:]_]\{1,\}\)/class_\1\2/'
+	'/^\<DEFINE_GUARD(\([[:alnum:]_]\{1,\}\)/class_\1/'
+	'/^\<DEFINE_GUARD_COND(\([[:alnum:]_]\{1,\}\),[[:space:]]*\([[:alnum:]_]\{1,\}\)/class_\1\2/'
+	'/^\<DEFINE_LOCK_GUARD_[[:digit:]](\([[:alnum:]_]\{1,\}\)/class_\1/'
+	'/^\<DEFINE_LOCK_GUARD_[[:digit:]]_COND(\([[:alnum:]_]\{1,\}\),[[:space:]]*\([[:alnum:]_]\{1,\}\)/class_\1\2/'
 	'/^context_lock_struct(\([^,)]*\)[^)]*)/struct \1/'
 )
 regex_kconfig=(
-	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\+\([[:alnum:]_]\+\)/\2/'
-	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\+\([[:alnum:]_]\+\)/CONFIG_\2/'
+	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\{1,\}\([[:alnum:]_]\{1,\}\)/\2/'
+	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\{1,\}\([[:alnum:]_]\{1,\}\)/CONFIG_\2/'
 )
 setup_regex()
 {

base-commit: 83deedcf85af511dc120b3cd8ee597d211cdf2fb
-- 
2.56.0

