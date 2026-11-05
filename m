Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907479;
	b=OanxtIUlpVTmx6LjAQ0hCCdFn8JZ7AxaPdM8+nzGPIBdex19F6yOL7Fn/KsX2IhtAaVf
	 J9oI8ZmlfichhZB6+4iSpCOyeORvqgu5C1sysXKyjV7JQsmDyN2eSfrEzCDX7B9PaVrG1
	 CL3FwehJK8DcnouW37urMAPV9psMqQ8lnJA1xRWBuGP+BYxNhk4Z+q/o3IMoSiY+IyAxO
	 8P3fdsN9d6nG0b4KHLosh0gS6w/LrtcDQidtNa/soNhLbSqzO0oyXFxcGwgl96hYoQtED
	 UadPEl795Tl7csxXQRTnvrbowYt7nHxdahWq56ZsIb3bbQ8UAh6S5iGqjr6umUM/1ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3AyWWDFVbKJ/DkrPhpXcM2lwKymyXBABHoZtsa2/+w4=;
	b=YjnSIuicr5Xymrpn04T+Qwcjpg6M8Dfkwe+M4mimYuB31o1NzBYCeXwzaoIxCCtGIIiG
	 oLaXJ6Ajvy1snCugZWDduuKRVMuvpG6ooUGKDniTaczI+q0dIRSfbzSlxbo6wRxJBXp+L
	 k1hzkidsYsO9/u6oMuD9GLH955KUwOU0TD1CjjNk5OBiJY5SjKwPDpu8I+1sC+KmO8b0B
	 3dzVeTqrAebzjvoZgiUlZm01JQSb5l0TM0BH89cUL0obVQqEdr6EMERoOB70T5CjOxrJF
	 jMJIKEOHAYCy7lu/zK5lvcnoXVkwqo6Tqhr+GkDVIFrbyBOdh5WcrIL8i4g+ZZk6YpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=cPl6L7vv;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31629607B973
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 19:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31629607B973
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=cPl6L7vv
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3706115eec.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 11:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1793907477; x=1794512277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AyWWDFVbKJ/DkrPhpXcM2lwKymyXBABHoZtsa2/+w4=;
        b=cPl6L7vv4IdiTxomRsfBZyJX59O6aKePsnYBsOL+Il0TM2e7QZLMYUoor5RewSvnv7
         vLLbLRMSyMW/YKWH7JVRt+VA8awqGEfSTnb3NSI212h84khTjynO2iw5mzK2nVh11z5d
         EZ6tC6WQcQkAThRjYpVZDYHpM0IHCup/ssjDItaCiUmXD6fNSzFXuqyMXfcjXo9Y3C18
         AjZA2LqCbQEPJQKpzTHX/9JMW5k+59UhN0TUOXzSYbdIuRgq6YZLqhp3MfDyp1FFBB4n
         21C0wHgHpp9aOnGvecq21MbiLJ846BIuczpuDUnGu78BBlZgT6V+04NGwiDJ3uZbl2e6
         YlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907477; x=1794512277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AyWWDFVbKJ/DkrPhpXcM2lwKymyXBABHoZtsa2/+w4=;
        b=lpiA9ZtA4kXE6fjR7mMpj/YccN3jku2YxWdMKF9zmBx22RtH8eBI5KYyizlmHRft3L
         6upKB+7AP2Or21djgGDDqlpX/u8tL2xGwkph+UozniH5ol8qEyRoE2+CO7M5Nxjc5G4p
         /yt2HSUp1U9Q5vRZGMbBu/R9hMFBy+/Cq8r7dS57tIQ0eRsMpiecI4lzAdNovvLV+eSM
         XNtEYiTMqbH61cFXqpjEcGqInaVDohVXJJQ8S6oYKz6BjahD9RrppFIJLAHIVT59G/yf
         Iz5qwcO3BpKZZt+/N0yPRwic5Lb+qlDAnuEbCXWeNeg9IRGURIErdmcrgRgmT6sUlFJf
         Yihw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ7R0WdzgLJyWuEB/Vn0wJaS4m2PITtPeq7k33hCpKinFUSIRplWURfzA9GhxP+HKk8r7w7zKJ0dzzfII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sTwh1QxicwtstlisUkaQX9S2XY+77hFKOx0rGs+15Uv0fooeD
	wnArppZb+vW/YKBuf7xIvJxeH9PAIN6SHMngsSNxqqs9kYtwFl0vDl+jFZKPnCKmSQ==
X-Gm-Gg: AYBFou1gvdntwISzje9EQaI6F+w5EJ3xdoT+BP4zNHHB55pcS9vI2E6QXijHLUnQuiS
	zP/fan8fK4BBUbYNvyZ9S9uQCFSnj2fbu0c5DDtz+MpSJVowtp1Xbuunz8fh2sK+RYx7Sj5cf0u
	YhJWoM2FPV2yrvxB3nxILAsSXNsvpsKpfrbuFFFkmcFJP8OEz0r3HuXnGAoXXE20wa3Q8jWz0e2
	KcMhQPVhvFBkEzreuX+3HvcABH9x/CZHpYZHfHOXRdLZsD94HvwogZDa42tkOnbW3xjGgMEGQ2k
	/jJ6Dk+B2tW+WPIPoazugWl9hJJ0J1D+V/wc+3UcGlcPATgYR3bgA+1ZVORT3g00Ovl4xCwjLND
	GTdprQWLxOBl7kwmC7dkfLIunukg/qH6r7wm6FR6SsLwtZck0SHtEOWNeM8oMDxHyyZjzFu4p13
	0bAnxGjcqHHAlVdXaWvbDnUoGwEdcA90l19DJm6qJAKUUR4UmHV587AgjjODytPp5jLxn+LPDtz
	Y1FW2OZLj+bUCgTR51GvsbyuZe7ktEMS/xhfe3LvuXfiIBYflxrqZi7Z21jYnnldIF/VwwaHvSv
	dFRSGsKOBBnOYRk9odXXNs0rEAL9JTi74wUPTLwnvtc5W3p4GbW8jwH5yN76B/67x+zw6VtL+K9
	1p0ggcZbR/YXlMrEgbmpquPQ=
X-Received: by 2002:a05:7301:6285:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36f76f0e752mr142560eec.38.1793907476899;
        Thu, 05 Nov 2026 11:37:56 -0800 (PST)
Received: from dannyhu-upstreamLinux.sjc.aristanetworks.com ([74.123.28.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72ec8a02sm326134eec.11.2026.11.05.11.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:37:56 -0800 (PST)
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
Subject: [PATCH v6 2/4] initramfs: add file metadata
Date: Thu,  5 Nov 2026 11:37:41 -0800
Message-ID: <20261105193743.2654656-3-dannyhu@arista.com>
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

From: Mimi Zohar <zohar@linux.vnet.ibm.com>

This patch adds metadata to a file from a supplied buffer. The buffer might
contains multiple metadata records. The format of each record is:

<metadata len (ASCII, 8 chars)><version><type><metadata>

For now, only the TYPE_XATTR metadata type is supported. The specific
format of this metadata type is:

<xattr #N name>\0<xattr #N value>

[kamensky: fixed restoring of xattrs for symbolic links by using
           sys_lsetxattr() instead of sys_setxattr()]

[sassu: removed state management, kept only do_setxattrs(), added support
        for generic file metadata, replaced sys_lsetxattr() with
        vfs_setxattr(), added check for entry_size, added check for
        hdr->c_size, replaced strlen() with strnlen(); moved do_setxattrs()
        before do_name()]

[zhangguangzhi: fix checkpatch warning EMBEDDED_FILENAME in
                include/linux/initramfs.h]

Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com>
Signed-off-by: Victor Kamensky <kamensky@cisco.com>
Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Signed-off-by: Tianxing Zhang <zhangtianxing3@huawei.com>
Reviewed-by: Jason Yan <yanaijie@huawei.com>
Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
Signed-off-by: zhoushuiqing <zhoushuiqing2@huawei.com>
Signed-off-by: zhangguangzhi <zhangguangzhi3@huawei.com>
Signed-off-by: Danny Hu <dannyhu@arista.com>
---
Changes in v6:
 - Document lack of support for POSIX ACL restoration. The main use case is to
   restore security.ima xattr for IMA use. POSIX ACL support is out of scope
   for this patchset
 - Check xattr name and value lengths to ensure they are valid and do not
   exceed the limit
 - Compare metadata header and record sizes against the remaining buffer
   length to avoid pointer arithmetic overflow in bounds checks
 - Use the kernel u32 type instead of uint32_t

Changes in v5:
 - For debug print in do_setxattrs(), use print_hex_dump_debug() rather
   than printing the xattr value as a string
 - Use u32 metadata record lengths and reject records smaller than their
   header

 include/linux/initramfs.h |  19 +++++++
 init/initramfs.c          | 103 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/initramfs.h

diff --git a/include/linux/initramfs.h b/include/linux/initramfs.h
new file mode 100644
index 000000000000..9b3839dc88a1
--- /dev/null
+++ b/include/linux/initramfs.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Include file for file metadata in the initial ram disk.
+ */
+#ifndef _LINUX_INITRAMFS_H
+#define _LINUX_INITRAMFS_H
+
+#define METADATA_FILENAME "METADATA!!!"
+
+enum metadata_types { TYPE_NONE, TYPE_XATTR, TYPE__LAST };
+
+struct metadata_hdr {
+	char c_size[8];     /* total size including c_size field */
+	char c_version;     /* header version */
+	char c_type;        /* metadata type */
+	char c_metadata[];  /* metadata */
+} __packed;
+
+#endif /*LINUX_INITRAMFS_H*/
diff --git a/init/initramfs.c b/init/initramfs.c
index ebddde9c8f0d..d206624d1160 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -10,7 +10,9 @@
 #include <linux/hex.h>
 #include <linux/init.h>
 #include <linux/init_syscalls.h>
+#include <linux/initramfs.h>
 #include <linux/kstrtox.h>
+#include <linux/limits.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/namei.h>
@@ -22,6 +24,7 @@
 #include <linux/types.h>
 #include <linux/umh.h>
 #include <linux/utime.h>
+#include <linux/xattr.h>
 
 #include <asm/byteorder.h>
 
@@ -189,7 +192,7 @@ static __initdata time64_t mtime;
 
 static __initdata unsigned long ino, major, minor, nlink;
 static __initdata umode_t mode;
-static __initdata unsigned long body_len, name_len;
+static __initdata unsigned long body_len, name_len, metadata_len;
 static __initdata uid_t uid;
 static __initdata gid_t gid;
 static __initdata unsigned rdev;
@@ -264,6 +267,7 @@ static void __init read_into(char *buf, unsigned size, enum state next)
 }
 
 static __initdata char *header_buf, *symlink_buf, *name_buf;
+static __initdata char *metadata_buf;
 
 static int __init do_start(void)
 {
@@ -365,6 +369,103 @@ static int __init maybe_link(void)
 	return 0;
 }
 
+static int __init do_setxattrs(char *pathname, char *buf, size_t size)
+{
+	struct path path;
+	char *xattr_name, *xattr_value;
+	u32 xattr_name_size, xattr_value_size;
+	int ret;
+
+	xattr_name = buf;
+	xattr_name_size = strnlen(xattr_name, size);
+	if (xattr_name_size == size) {
+		error("malformed xattrs");
+		return -EINVAL;
+	}
+
+	if (!xattr_name_size || xattr_name_size > XATTR_NAME_MAX) {
+		error("invalid xattr name length");
+		return -EINVAL;
+	}
+
+	xattr_value = xattr_name + xattr_name_size + 1;
+	xattr_value_size = buf + size - xattr_value;
+	if (xattr_value_size > XATTR_SIZE_MAX) {
+		error("xattr value exceeds size limit");
+		return -EINVAL;
+	}
+
+	ret = kern_path(pathname, 0, &path);
+	if (!ret) {
+		/*
+		 * POSIX ACL restoration is currently unsupported.
+		 * vfs_setxattr() rejects POSIX ACL xattrs with -EOPNOTSUPP.
+		 */
+		ret = vfs_setxattr(&nop_mnt_idmap, path.dentry, xattr_name, xattr_value,
+				   xattr_value_size, 0);
+
+		path_put(&path);
+	}
+
+	pr_debug("%s: %s size: %u (ret: %d)\n", pathname, xattr_name,
+		 xattr_value_size, ret);
+	print_hex_dump_debug("xattr value: ", DUMP_PREFIX_OFFSET,
+			     16, 1, xattr_value, xattr_value_size, false);
+
+	return ret;
+}
+
+static int __init __maybe_unused do_parse_metadata(char *pathname)
+{
+	char *buf = metadata_buf;
+	char *bufend = metadata_buf + metadata_len;
+	struct metadata_hdr *hdr;
+	char str[sizeof(hdr->c_size) + 1];
+	u32 entry_size;
+
+	if (!metadata_len)
+		return 0;
+
+	str[sizeof(hdr->c_size)] = 0;
+
+	while (buf < bufend) {
+		int ret;
+
+		if (bufend - buf < sizeof(*hdr)) {
+			error("malformed metadata");
+			break;
+		}
+
+		hdr = (struct metadata_hdr *)buf;
+		if (hdr->c_version != 1) {
+			pr_debug("Unsupported header version\n");
+			break;
+		}
+
+		memcpy(str, hdr->c_size, sizeof(hdr->c_size));
+		ret = kstrtou32(str, 16, &entry_size);
+		if (ret || entry_size < sizeof(*hdr) ||
+		    entry_size > bufend - buf) {
+			error("malformed xattrs");
+			break;
+		}
+
+		switch (hdr->c_type) {
+		case TYPE_XATTR:
+			do_setxattrs(pathname, buf + sizeof(*hdr),
+				     entry_size - sizeof(*hdr));
+			break;
+		default:
+			pr_debug("Unsupported metadata type\n");
+			break;
+		}
+
+		buf += entry_size;
+	}
+
+	return 0;
+}
+
 static __initdata struct file *wfile;
 static __initdata loff_t wfile_pos;
 
-- 
2.51.0

