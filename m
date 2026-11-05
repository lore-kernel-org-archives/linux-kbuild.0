Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907477;
	b=DZCbjQLZ0tjHc2gWXHnl/GBnLsm1z4cUtVeU92oUQSV/GRMtYFczOPGw70ObfBtGE/Wb
	 bp8zfc94mL/e9i1XvrlbjdSbFaXKClWbxCDLOyBhHBLCr0PU3mbZM2FUM2G/+EfW1r1Nx
	 hH/QOo3AROQw+CI+ICjYwManjlpnTyNlum70gfg8O2ygO6Qz8Wa6cm1k32y1Hje0g+EwH
	 MdCukN7hVDseL1caG4r/y/3MPwFebGgOXJQpaowtFvZJ5GLd36I48jpBylS3UlgOZHxOv
	 rHAYtbQUdK+HkFWszUHifr6fW3hQqK4JnGlAws10i0k1xkT/9zieARYjxS0FVrFPnkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GEs52XSVkXr3Lysumh8vBcPCuRt3C+96FDYzKDRWk9o=;
	b=v95tt3AMqFjGgJtJ9jYuG234BYclx0R+P9N4rk8lXjS3SFResoIZz7lqztt+gKiQ8OiC
	 M7Ah8nYvybMqpUejyETBOLQEKMx/vmoELX62r9GwRcg8aUXkc9sLh9CjCiW0MiaKHoPaK
	 l60hGOuK1J/rkts9TWxl7j0T3wOrjNje3HVIu5Kc3+DsjTG6PY4cJ4rhWwBuZDKjshut1
	 QXlC7FI9D22bD3kO35VUYndnweTopCfmTHQkRSgEUsz2vzG7Q79zLbRrBw16Z7y+i/acc
	 lrZCvYy8Hh8O7+zjMcvnUKHUVwuqlv93xBXZ4vYeHx3VQ8IHiLFlTLS+hsfRnOdyajg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=CpWYY4HP;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDFF606B9F2
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 19:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDFF606B9F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=CpWYY4HP
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f6295304dso169471eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 11:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1793907476; x=1794512276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEs52XSVkXr3Lysumh8vBcPCuRt3C+96FDYzKDRWk9o=;
        b=CpWYY4HPqsMqathLuCP0SqyPHsMFAQWoskfk2GdP07u48l12UmKTiwONJuvB++DOZo
         Yclhv2OYTvpyVQe0nGDznRS9Z3hWx2kbCBFvY0pqnRrXO41EfaKHYTGa75im9YoH0HyQ
         yVlSieODB043s7YTZG83QMLxA1SHJ8toDshd16zaROUJAf2wNKauWeStmi1bLrH6/8Tz
         mQQW4N4m8vwam53SdfBwr6BB3a+iuCtW3J6Db2OjYNgcUSfpF/y05AZgZRu+kEXd/N4u
         Ct4MdT86o/xNJxf/iCp+y8jz1OLKeZSYtEQMz8MNbuIitFs0Ewo+oz4HzT9k1iLJwTE9
         Ebzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907476; x=1794512276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEs52XSVkXr3Lysumh8vBcPCuRt3C+96FDYzKDRWk9o=;
        b=uaVulnV32yJJuOvPboCOQfz8D/puLjeYFj+vhFVyyFPcOJfEIzJsYapAM6BYJKVYGe
         fnSA4f8M1ljWndB5b7o+Kw0uuJT4VDV+Z/CfTaHdsta98jDh29HeHCbhkVtZwFs+knOy
         wYIsdNewPWZYuJ1e49ud9bkvVnPku1wljXwZESGkbEYklQihkP7a7yoaR1z7Tp6o9itB
         +ddsnIbHGH8q9rtGBzSc49oVhD5VtGyat76qbXfpek1nb3EQlJZ8NgOvzpE/jv1HyWHU
         x3L9lE1yyHeiQOUtMtUcupJjB1peq2CMn8mPc+5AJANpKZVPIRIcwqFatz4zmdXT3QEV
         tHwA==
X-Forwarded-Encrypted: i=1; AKwUvBwXb9PbrS5MYshl9qRgU/z648NXQ725GFtp/w/zDVOi13ZslMrry/KLSEs7C46j2uThcpxNFHjJKLvk1dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EduUJXtWwHOL87F0b3XKyilEfhj9gaHZiItDnIoDe/mL+qEHs
	Ustjw9Th1eoejH1PXrp0S7M++0C4KEkrVKr9LyZOS74uoLQEtJKcqNHsMqaV7VSPKw==
X-Gm-Gg: AYBFou2KFldVXvmB7+cH6Jk6j7nWzeTJwLaHUIgqC2lRwTk7G+/g1VrpGSjQBtiOwxO
	iAl9PbCbD/BTpWFCb99JF0RTOV+pkxLJvFlAXCocnR410ewc8Igzw8BU8q11CCoKZnmhP3vZkZf
	7R2FzpD+nxjFHh9MrOJpzYYXRis8D78fkJZvHY/gJHivcV6xhQG/LtVJmfu7zEclEtSxNX+J0YQ
	hmWujYg6l+4yahkd7v9vtW65mSZfuSbytilBUd3Y3PrvaSm92wKjBJaRlj+461kRtguYjU7KMMB
	U0J2zXW9wcq6XnV/8o3eEiK9jj+4SHqi7o543l8gyV+Mb7S148FGZk92BT/C5C1eCXjsAbghqbT
	mJSTLNnwWmAJYSJkk7YJ//mVzIN8yGa3XnmupckoBrycPkMrZ2vFX6hzN9RPRtLT/uQ2kpjr2V7
	wGH8EI939iWB28NTN/kPc6Hs0r6B9HoDjMq15wpbWJOS1BVuZz473tjiDFZDV61bhLbV4UXwETR
	HST7Km8TFIxuvdJ0uVcBPjhnpglNHBy2aafu+d1dGYBuBmnqgA1Tqub0+yL8C8jwKjnoz8cE/qc
	Mm3ycu66tuIRwWY24aYcQp6GFs845phgFYL3XqL0feOGQ2A7oB9k2dfxWL6yzTTDA6obTuRpl8G
	R9f8G31HX9enquiSbu9ynBl4=
X-Received: by 2002:a05:7300:3e97:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-36f75254a98mr150454eec.10.1793907475358;
        Thu, 05 Nov 2026 11:37:55 -0800 (PST)
Received: from dannyhu-upstreamLinux.sjc.aristanetworks.com ([74.123.28.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72ec8a02sm326134eec.11.2026.11.05.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:37:54 -0800 (PST)
From: Danny Hu <dannyhu@arista.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Jan Kara <jack@suse.cz>,
	Victor Kamensky <kamensky@cisco.com>,
	Taras Kondratiuk <takondra@cisco.com>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	zhangguangzhi <zhangguangzhi3@huawei.com>,
	Danny Hu <dannyhu@arista.com>,
	Jason Yan <yanaijie@huawei.com>,
	silviu.vlasceanu@huawei.com,
	hpa@zytor.com,
	arnd@arndb.de,
	james.w.mcmechan@gmail.com,
	niveditas98@gmail.com,
	pierre@arista.com,
	julien@arista.com,
	kbharathi@arista.com,
	alexandr.lobakin@intel.com,
	linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bug-cpio@gnu.org
Subject: [PATCH v6 1/4] ima: skip algorithm availability check until initramfs unpacking is finished
Date: Thu,  5 Nov 2026 11:37:40 -0800
Message-ID: <20261105193743.2654656-2-dannyhu@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261105193743.2654656-1-dannyhu@arista.com>
References: <20261105193743.2654656-1-dannyhu@arista.com>
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

With CONFIG_IMA_APPRAISE=y, restoring xattrs during initramfs unpacking
can deadlock the kernel if the xattr being restored is signed with a hash
that the kernel does not already have available. This occurs when the
ima_inode_setxattr() hook calls crypto_has_alg(). crypto_has_alg() may
synchronously request a module leading to a circular dependency where the
userspace helper waits for initramfs unpacking to complete while initramfs
unpacking waits for the userspace helper.

Guard this crypto availability check in validate_hash_algo() until
initramfs unpacking is complete. This prevents the kernel from requesting
a module during unpacking and allows security.ima xattrs to be restored
even if the hash algorithm is unavailable in the running kernel.
Essentially, this flag distinguishes restoration of existing metadata
during initial population from setting/changing an xattr during runtime.

A benefit of this approach is that once unpacking is complete, all
subsequent xattr updates go through the same codepath as before which
preserves the existing behavior during normal userspace operation.

Signed-off-by: Danny Hu <dannyhu@arista.com>
---
 security/integrity/ima/ima_appraise.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 63b0cb957c65..1403f5653973 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -20,6 +20,14 @@
 
 #include "ima.h"
 
+static bool ima_initramfs_populated __ro_after_init =
+	!IS_ENABLED(CONFIG_BLK_DEV_INITRD);
+
+static void ima_notify_initramfs_populated(void)
+{
+	ima_initramfs_populated = true;
+}
+
 #ifdef CONFIG_IMA_APPRAISE_BOOTPARAM
 static char *ima_appraise_cmdline_default __initdata;
 core_param(ima_appraise, ima_appraise_cmdline_default, charp, 0);
@@ -738,6 +746,22 @@ static int validate_hash_algo(struct dentry *dentry,
 		if (likely(xattr_hash_algo == ima_hash_algo))
 			return 0;
 
+		/*
+		 * IMA validates the crypto algorithm whenever the security.ima
+		 * xattr is set. Restoring xattrs during initramfs unpacking
+		 * can call crypto_has_alg() before unpacking has completed.
+		 *
+		 * If the algo is unavailable, crypto_has_alg() may
+		 * synchronously request a module. The userspace helper waits
+		 * for initramfs unpacking to finish and creates a circular
+		 * dependency.
+		 *
+		 * Skip the algorithm availability check until initramfs is
+		 * populated to avoid this deadlock.
+		 */
+		if (!ima_initramfs_populated)
+			return 0;
+
 		/* allow any xattr using an algorithm built in the kernel */
 		if (crypto_has_alg(hash_algo_name[xattr_hash_algo], 0, 0))
 			return 0;
@@ -829,6 +853,7 @@ static struct security_hook_list ima_appraise_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(inode_set_acl, ima_inode_set_acl),
 	LSM_HOOK_INIT(inode_removexattr, ima_inode_removexattr),
 	LSM_HOOK_INIT(inode_remove_acl, ima_inode_remove_acl),
+	LSM_HOOK_INIT(initramfs_populated, ima_notify_initramfs_populated),
 };
 
 void __init init_ima_appraise_lsm(const struct lsm_id *lsmid)
-- 
2.51.0

