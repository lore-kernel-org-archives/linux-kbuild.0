Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394619;
	b=HVIapIbc2S+6MxYNG/9CH0zDzBplWP721f8RhfXy76yaHby7GRJJa42inB+0Pr4AkkwV
	 BtZ6q1YAcE7fgDB6680vrYQJnWO6q7K5UhA+Tc53WizHAl6WO9Kub1iuldWGnKuna6WxH
	 vuEdf6HvFplz1g3U9sTYgyQEbV9cnbbAfo3ddXZZcXakDt4xQYzLUd7llgO3YvoIUGoHA
	 VqaM8/5kjMwu5Xdhhedh546dTopi/hOFuL4ew+ZrN0rg28Qpq+iDpF7DFgRIVBGjdJl1t
	 BFCO1UkSSiD6T+HPHz/54lp3QPkuQ5LSZAkmzn666El0OuVzfmwUyAEINsN2yORUKwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NRj5hwEzENLjlsB+UAcfFJohIr0Hf4YgXfYZEvjse4o=;
	b=IgV/k9voTfkO4Cpy5bzbTB6QCmxS0tT2k8m5WU0r/PMtc5j1M5k50MmXGurddqXkZGZC
	 DNxREgi2tzn0MdGwtiVHCGFBXit+0Z5q2U8JfA/pG5Vqqzx45IQBr6bDFpv+2bhK3CDTy
	 1Hhkv8HgX1qP4pvdyxNNKtYWICyrOw7x2sHVEch8Aq6Hq98FJ7o8wllc2cvHqUZ8Tpls9
	 jYNhJUlomRNbkkCf5rfz/Xx1RVUciMV9gASnRnxG9Ed7q5BlDhPbtFoSo/udH37hg3Vcl
	 EahKDzBOfF25oP5Lo/V2waT8CGdGHQ0qQDMB0vaURhq5lEIsCWa6HZJPaMafTNOCcJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=Q+l1mbbi;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05860A262C
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 21:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB05860A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=Q+l1mbbi
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14fc585291cso1060461c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 14:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1793394618; x=1793999418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRj5hwEzENLjlsB+UAcfFJohIr0Hf4YgXfYZEvjse4o=;
        b=Q+l1mbbiKUvjbillm6pdJDpPjF2pQbA9OXFE3js3iBgUUgRIvYtGZk1vlSB8K/HTYA
         JHLWZiJdKozGA+8AxwHbiJNr/oGfNBn1ferC3KPHky9ffn1z68fIGBbdcJkXju0iMcjW
         D7U+S4awiVjIJvkF7oc3ImP0tcsgng9AgW3ZnSKa67rHNurXCk1N9rZPBacfFZaYkbNf
         GLpXVaw0Vn7aHSe6c1RH7FMY2Y0M8a9KhDUI6N/CNshZuvHLimKPE9hD1zC08ZX9FBNm
         tiLFtax3PWuUY+9ZwdfpCHLjjYVGmkIWm3+1+49K8AAuIDQ6MaoqvIsBm3lhULlRz9Og
         7KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394618; x=1793999418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRj5hwEzENLjlsB+UAcfFJohIr0Hf4YgXfYZEvjse4o=;
        b=pl+UWfPDMYqsR0/OaLvM6jC8VeDBxjjQCRSla+DmbNZaENZViqHUNrhmERvCQyzvMM
         Em3k5wH064LvfFzEmsx7Mbdu3FGRl+NZh0Pfp/H5kbC0KGDWIjNL7GIBs6TDtS4/4KMB
         1AU5pctfexX7oeRAjO0S2XGi+gCqlS9Pno4jrmdurk9kVjOvfq9o7huU/Owkad0ojPB3
         bvWYUmJhEUOMUCjXBowMJo08p2hU4h4c09RvMx+BQdz8g9wT4eQrDvAz9F9PZaKH/Imq
         wT+b7vJEawgiq2za551hKAz7j2Fy22+pzjGrNHj2MOAWXHltHonTfMu0Sc2Tox63kiij
         0D3w==
X-Forwarded-Encrypted: i=1; AKwUvBwQ2M+Lt+mgo4vngkcSs3ffIhl4Z4/jmPBFE2L0/5e9ZCvnKDVF6aJPm9ccrr1j8CHVkGkaubJlL4rYz1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoXdsh9gnjZlihpeeSZUuOXsf/UbuEln2RXvrhs+F97rbtTeML
	zFV1VrbO/+UPbzK2aUEppYGsqL6Vg93ji9JohtBMyIxryq+OD5lQFIf0k81t9J/pcw==
X-Gm-Gg: AYBFou1HfXVCWUUO4SoeeGyGX+QFeD0ObSPmZOPRKuloGSD2xHKeiGKlJw1q9PEySnA
	cIGOT4UpEJWJB5MiMAaxeiiN+KKimfGXBUbAIAUsAKPlO+6Rp6hYqSagh3gHULNgrytXPT2a4gu
	4CSXsVEwY1TNy4R/lfhQzvzhXEgH+SMW82UVk1TzmY22Vq4DckH4aKaF4t3T51EtH1Lg6beEyC0
	CHG0zyRzquIMdmvDcXH6IMn12Vd5q1x8Sz5rm4M4sYnrzMR0P8vQ8pVaQpHe03m7CHkVEKq4mwZ
	mBwBjdeYGIc7xzKaZ3v/eaw291wGjfk2SJmj0Xtb/sCIisbe7L0rytgzSv0JwgXsvGyMmUFzb6M
	6OEE9a1a0BwDepG3laKRrqF6XRCegKanMbLYO20QZO9c8HFAzcXa4TFj4H6Xu+prLDdYlyrZBaZ
	r5N79w7cfvK2gQnd5D1UelyrheHq39QdQjLD838i4RO8WxsafoTzKrz/NVlp+sMDeRaQfJyD7UM
	ctj6ukGaASjVeDENK4tclv5LRD5A+/Eg4t0VM5a8HP+Od9aHA7qniJKp0uGnicIth/aRf5LPmhT
	3nOvaf0onmixZCPLscbPB7MzTLzD7GE7feRNfF5v92caB6c5EbpTo1ZbIQGO0zBu/JZtJQmdYLj
	Jrk11RKS+q16OtMiSq2P6ntA=
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr5911022c88.19.1793394617878;
        Fri, 30 Oct 2026 14:10:17 -0700 (PDT)
Received: from dannyhu-upstreamLinux.sjc.aristanetworks.com ([74.123.28.18])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcf67csm9471777c88.21.2026.10.30.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:10:17 -0700 (PDT)
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
	Tianxing Zhang <zhangtianxing3@huawei.com>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	zhoushuiqing <zhoushuiqing2@huawei.com>,
	zhangguangzhi <zhangguangzhi3@huawei.com>,
	Danny Hu <dannyhu@arista.com>,
	Jason Yan <yanaijie@huawei.com>,
	silviu.vlasceanu@huawei.com,
	hpa@zytor.com,
	arnd@arndb.de,
	rob@landley.net,
	james.w.mcmechan@gmail.com,
	niveditas98@gmail.com,
	pierre@arista.com,
	julien@arista.com,
	kbharathi@arista.com,
	erosca@de.adit-jv.com,
	alexandr.lobakin@intel.com,
	jim_baxter@mentor.com,
	linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bug-cpio@gnu.org
Subject: [PATCH v5 3/4] initramfs: read metadata from special file METADATA!!!
Date: Fri, 30 Oct 2026 14:09:42 -0700
Message-ID: <20261030210944.2143778-4-dannyhu@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261030210944.2143778-1-dannyhu@arista.com>
References: <20261030210944.2143778-1-dannyhu@arista.com>
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

From: Roberto Sassu <roberto.sassu@huawei.com>

Instead of changing the CPIO format, metadata are parsed from regular files
with special name 'METADATA!!!'. This file immediately follows the file
metadata are added to.

This patch checks if the file being extracted has the special name and, if
yes, creates a buffer with the content of that file and calls
do_parse_metadata() to parse metadata from the buffer.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Tianxing Zhang <zhangtianxing3@huawei.com>
Reviewed-by: Jason Yan <yanaijie@huawei.com>
Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
Signed-off-by: zhoushuiqing <zhoushuiqing2@huawei.com>
Signed-off-by: zhangguangzhi <zhangguangzhi3@huawei.com>
Signed-off-by: Danny Hu <dannyhu@arista.com>
---
v5 changes:
 - clean up metadata buffer when returning from unpack_to_rootfs()

 init/initramfs.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 36254dba7822..a1744cc9523c 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -265,8 +265,8 @@ static void __init read_into(char *buf, unsigned size, enum state next)
 	}
 }
 
-static __initdata char *header_buf, *symlink_buf, *name_buf;
-static __initdata char *metadata_buf;
+static __initdata char *header_buf, *symlink_buf, *name_buf, *previous_name_buf;
+static __initdata char *metadata_buf, *metadata_buf_ptr;
 
 static int __init do_start(void)
 {
@@ -454,6 +454,7 @@ static int __init __maybe_unused do_parse_metadata(char *pathname)
 
 static __initdata struct file *wfile;
 static __initdata loff_t wfile_pos;
+static __initdata int metadata;
 
 static int __init do_name(void)
 {
@@ -471,6 +472,10 @@ static int __init do_name(void)
 	if (strcmp(collected, "TRAILER!!!") == 0) {
 		free_hash();
 		return 0;
+	} else if (strcmp(collected, METADATA_FILENAME) == 0) {
+		metadata = 1;
+	} else {
+		memcpy(previous_name_buf, collected, strlen(collected) + 1);
 	}
 	clean_path(collected, mode);
 	if (S_ISREG(mode)) {
@@ -508,11 +513,47 @@ static int __init do_name(void)
 	return 0;
 }
 
+static int __init do_process_metadata(char *buf, int len, bool last)
+{
+	int ret = 0;
+
+	if (!metadata_buf) {
+		metadata_buf_ptr = metadata_buf = kmalloc(body_len, GFP_KERNEL);
+		if (!metadata_buf_ptr) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		metadata_len = body_len;
+	}
+
+	if (metadata_buf_ptr + len > metadata_buf + metadata_len) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	memcpy(metadata_buf_ptr, buf, len);
+	metadata_buf_ptr += len;
+
+	if (last)
+		do_parse_metadata(previous_name_buf);
+out:
+	if (ret < 0 || last) {
+		kfree(metadata_buf);
+		metadata_buf = NULL;
+		metadata = 0;
+	}
+
+	return ret;
+}
+
 static int __init do_copy(void)
 {
 	if (byte_count >= body_len) {
 		if (xwrite(wfile, victim, body_len, &wfile_pos) != body_len)
 			error("write error");
+		if (metadata)
+			do_process_metadata(victim, body_len, true);
 
 		do_utime_path(&wfile->f_path, mtime);
 		fput(wfile);
@@ -524,6 +565,8 @@ static int __init do_copy(void)
 	} else {
 		if (xwrite(wfile, victim, byte_count, &wfile_pos) != byte_count)
 			error("write error");
+		if (metadata)
+			do_process_metadata(victim, byte_count, false);
 		body_len -= byte_count;
 		eat(byte_count);
 		return 1;
@@ -539,6 +582,7 @@ static int __init do_symlink(void)
 		return 1;
 	}
 	collected[N_ALIGN(name_len) + body_len] = '\0';
+	memcpy(previous_name_buf, collected, strlen(collected) + 1);
 	clean_path(collected, 0);
 	init_symlink(collected + N_ALIGN(name_len), collected);
 	init_chown(collected, uid, gid, AT_SYMLINK_NOFOLLOW);
@@ -614,6 +658,7 @@ char * __init unpack_to_rootfs(char *buf, unsigned long len)
 		char header[CPIO_HDRLEN];
 		char symlink[PATH_MAX + N_ALIGN(PATH_MAX) + 1];
 		char name[N_ALIGN(PATH_MAX)];
+		char prev_name[PATH_MAX + N_ALIGN(PATH_MAX) + 1];
 	} *bufs = kmalloc_obj(*bufs);
 
 	if (!bufs)
@@ -622,6 +667,7 @@ char * __init unpack_to_rootfs(char *buf, unsigned long len)
 	header_buf = bufs->header;
 	symlink_buf = bufs->symlink;
 	name_buf = bufs->name;
+	previous_name_buf = bufs->prev_name;
 
 	state = Start;
 	this_header = 0;
@@ -664,6 +710,9 @@ char * __init unpack_to_rootfs(char *buf, unsigned long len)
 	dir_utime();
 	/* free any hardlink state collected without optional TRAILER!!! */
 	free_hash();
+	kfree(metadata_buf);
+	metadata_buf = NULL;
+	metadata = 0;
 	kfree(bufs);
 	return message;
 }
-- 
2.51.0

