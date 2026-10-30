Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394617;
	b=uf//+MaattQtm2OKCa6ikAXIHIfQIYw3WBuciJAUhzViCKA1IJtbR/n3SGBBbuBRdwCQ
	 DfA9CqeACVHD6GxdVn3l8SRBx7FIy1GXcHUZUejZyB+KBAR94gKASNwC9ZE5m6ZUY1sbV
	 QiF944iEb6hW1wN99bmzgF6v3Meq4haVHCqmcpDXmDxZp+WSoC5eYNnghL/AS5vdYyE6F
	 OHu4bYPRH1EDhG5PF8XfIvh0WOPZr8lyksKNMX1DXK0yBgYrILYDLfI79GscpIS2lHhUb
	 q+9xcFRNXeTmrxLQbcHEVkNvM8NRbyEHtGnwB8ZPAWkRTRLFuKWVgG/iEEoTl7cZlEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WWFHdhsqkiSrahXyVyHuACAJn5u+mkpktpUzIjfAX54=;
	b=IeOKyhegBoTrHz2tXXy1/F72wyTrMfdzloojoksJwJfI/x5ySI/Xa15yKtdRQcu5PD+u
	 OHgkaGdQpUYv4bhXYnVDl5qB88oEqFiojcdm9haZ1PoW4FImFX/a2/ffKylUzm5XxCHNz
	 0Hk0RN1/SgYPP8OGw/df9WlFkArObanH6wq9/MMeyhkgCX2l7JRPTKq0y6hAbz+3vpaiv
	 YnLjq/1Zl923BMG+n8sKhpdnh0PpJks2FXTAuVG6USA2ignmpjoet8CReKgLOoOr8DKe+
	 cZpz0Pi77QsQtXN6v5el+YWXE3LvfEeJetq/YN8fpqYnbqIFSxuPOLbt9TYx0s+bCJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=P0lSfjVa;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1308606A325
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 21:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1308606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=P0lSfjVa
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a17a332ecso2121116eec.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 14:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1793394614; x=1793999414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWFHdhsqkiSrahXyVyHuACAJn5u+mkpktpUzIjfAX54=;
        b=P0lSfjVa5VExTm/Kq08n8ihVkx7rkKYIvUOMqyeQqyz0cjuC358NAarNKPFU3MC8Ou
         3lbn7+iB75qWsPERpWE+gooZ7FEvOk9lY1j6deh5ncndOQQdf7TDPxSkCrJZru9Skzk8
         b13DBvjkp9TloNUCjDrINaYomz8hJUTBQlOOoCx1vz0DGO4sIhu/oJnpbgtaqHthxQCe
         xcj1/AFSeTX4sotvtK68Ypjbh2OQCBJL4nTASTGX8E1mAKJUtXm3SaCadDiQ4vIZ6SuO
         ARPrkLFntRjr0QZjl3MhDyh1DpkzxEByND4kaqwPY/SMPBOKXFzeXNKFWEVuZWFDMgE1
         bUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394614; x=1793999414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWFHdhsqkiSrahXyVyHuACAJn5u+mkpktpUzIjfAX54=;
        b=TTNOrpJ/KCa1uIaXiR/4QFk6w13YuO40QjJUXi33sUg5IU9CkP54jS2Fpd6e9SJ6A4
         /dWktWfnUm9UI33A82Ta5oq10KyH9FYNnfa4upPb7nv96o3ssgELmcjblv2DrXLM1aXB
         XnuNsL0h+dUMuHzfieUpTcWOV2vXtodwNFQiGw0vRi/l5B4ONAFJTJG79/pY4bARrpzQ
         gwJox13rVZQKKSARi2UWyFxSLZrTXM/aQSt8OcCaRRZD1Dt4ve4xoRZ/+vddwunX8a4W
         HVBnFLjJkVU98kUYyP1EpwhxEB70zSeTKQ7n6iGC1yEdPqh5nCSMuXKYgrrBv/4CcWBW
         vbMg==
X-Forwarded-Encrypted: i=1; AKwUvBznkq9f0KnJ2J5aHr9zFcLn4Dj2/JgOBwCodab6Fx6qnQ0hQa7xFaJB79b5jyvqA3fBHVtbH4GuOHJ3z3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfpdZRHUtwzb22Z3xY5rV4s/FpXsMRZ+5xdjb9gxAaLQJhAeka
	N7UtOCtrzl+5kUD179ALeu9/Q6Jb+i5qrlvK7VOtro4Mkxfq+eaSiuOTIjQ408g21g==
X-Gm-Gg: AYBFou1/Pk2iWb3uKFhP1NWVrj6VH7VMNz6iizEJLyzW/Gcph/t28TB71MqEbOF4sNP
	gIWAt/KWJe+FgmNE11yxzv8ek0smjb0AOxzVzZwBnX8qkvn8grhRsftJsr+LZkPnxac5giEgY3d
	VXxGm4El6I4pvwMTKefpIdAXkJOcKeJvuFoFBCeHXuDonStHJcQ8d4zIkCGaODbm5TVrc7FvWee
	Hk/7kQcNWJ6YxHoUOmOBcohKNwHUP4wvwExKVVkrXW29gUXEmY1EiIZ1oVsrC8qOoSAwq0bVQDX
	Ji30fTOilYUAzLvpd+woPdsXq60aqDYFjInDhu5GrKXNZwsJgc38wWXLdzE9eSrHuDo05vC3IA8
	eS5LTN1HVzujGHgWKrSrU54o6U4Kvb9/oAizEoIgN4GH8cvrigfNJu0l+tQYkpIkQQQCfWD7gUN
	CKMzU6GUhuUp91JVr3B9l35gd2xOVWTILxU4mEBJWwgO/pu/sKWrSguo1ADz11nA1yqFGZw7J7D
	G61dmdWzY6KpQWCek9BuinA7+rFsa+Fo5B9IvohWmtg0I4z0XHTWaa6NsAWvMGln3/+0e+VTtcZ
	V6prJUBVG0ONJDedzdpyrwwm6hGPrujZwPcljpeYaxlNiNQJKBzs3QPQMEbKPByW6IEnUWFBTBG
	9m5EOWigjrwgeuXycEzBcYWU=
X-Received: by 2002:a05:701a:c907:b0:185:33ab:4d55 with SMTP id a92af1059eb24-1ac5f1810d2mr4226717c88.29.1793394600810;
        Fri, 30 Oct 2026 14:10:00 -0700 (PDT)
Received: from dannyhu-upstreamLinux.sjc.aristanetworks.com ([74.123.28.18])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcf67csm9471777c88.21.2026.10.30.14.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:10:00 -0700 (PDT)
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
Subject: [PATCH v5 0/4] initramfs: add support for xattrs in the initial ram disk
Date: Fri, 30 Oct 2026 14:09:39 -0700
Message-ID: <20261030210944.2143778-1-dannyhu@arista.com>
X-Mailer: git-send-email 2.51.0
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

This patch set aims at solving the following use case: appraise files from
the initial ram disk. To do that, IMA checks the signature/hash from the
security.ima xattr. Unfortunately, this use case cannot be implemented
currently, as the CPIO format does not support xattrs.

This proposal consists in including file metadata as additional files named
METADATA!!!, for each file added to the ram disk. The CPIO parser in the
kernel recognizes these special files from the file name, and calls the
appropriate parser to add metadata to the previously extracted file. It has
been proposed to use bit 17:16 of the file mode as a way to recognize files
with metadata, but both the kernel and the cpio tool declare the file mode
as unsigned short.

This v5 revives Roberto Sassu's v4 series posted on May 23, 2019
(https://lkml.org/lkml/2019/5/23/415). The github issue tracking the
revival of this patchset is here
(https://github.com/linux-integrity/linux/issues/11).
This revision incorporates unpublished changes
from other contributors that can be found in
(https://github.com/linux-integrity/linux/tree/initramfs-xattr-v1-devel-v1)
and adapts the implementation to newer kernel interfaces. Compared with
v4, this revision adds an IMA deadlock fix for restoring security.ima
xattrs during initramfs unpacking, switches to a Kconfig choice for
metadata type selection, and updates gen_initramfs.sh to pass source
paths to gen_init_cpio for nonregular entries, allowing their xattrs to be
read from the correct source object that will be included in the archive.
This revision also includes various improvements to error path cleanup,
debug output and tool documentation.

The difference from v2, v3 (https://lkml.org/lkml/2019/5/9/230,
https://lkml.org/lkml/2019/5/17/466) is that file metadata are stored in
separate files instead of a single file. Given that files with metadata
must immediately follow the files metadata will be added to, image
generators have to be modified in this version.

The difference from v1 (https://lkml.org/lkml/2018/11/22/1182) is that
all files have the same name. The file metadata are added to is always the
previous one, and the image generator in user space will make sure that
files are in the correct sequence.

The difference with another proposal
(https://lore.kernel.org/patchwork/cover/888071/) is that xattrs can be
included in an image without changing the image format. Files with metadata
will appear as regular files. It will be task of the parser in the kernel
to process them.

This patch set extends the format of data defined in patch 9/15 of the last
proposal. It adds header version and type, so that new formats can be
defined and arbitrary metadata types can be processed.

The changes introduced by this patch set don't cause any compatibility
issue: kernels without the metadata parser simply extract the special files
and don't process metadata; kernels with the metadata parser don't process
metadata if the special files are not included in the image.

From the kernel space perspective, backporting this functionality to older
kernels should be very easy. It is sufficient to add two calls to the new
function do_process_metadata() in do_copy(), and to check the file name in
do_name(). From the user space perspective, unlike the previous version of
the patch set, it is required to modify the image generators in order to
include metadata as separate files.

Changelog

Changes in v5 relative to v4:
- Rebase onto vfs.all
- Add an IMA fix to avoid a deadlock during initramfs metadata restoration
- Use u32 metadata record lengths and reject records smaller than their
  header
- Improve debug output for binary xattr data
- Cleanup metadata buffers at the end of unpack_to_rootfs() 
- For CONFIG_INITRAMFS_FILE_METADATA, replace the metadata string prompt
  with a none/xattr choice
- Fix resource cleanup and format specifiers in gen_init_cpio
- Update gen_initramfs.sh to pass source paths to gen_init_cpio.c for
  nonregular entries (slink, dir, nod). Modify gen_init_cpio to
  properly collect xattrs from the source object. Without this change,
  xattrs will not get included for slink, dir and nod.
- Add documentation of xattr option in usage() for gen_init_cpio

v3:
- include file metadata as separate files named METADATA!!!
- add the possibility to include in the ram disk arbitrary metadata types

v2:
- replace ksys_lsetxattr() with kern_path() and vfs_setxattr()
  (suggested by Jann Horn)
- replace ksys_open()/ksys_read()/ksys_close() with
  filp_open()/kernel_read()/fput()
  (suggested by Jann Horn)
- use path variable instead of name_buf in do_readxattrs()
- set last byte of str to 0 in do_readxattrs()
- call do_readxattrs() in do_name() before replacing an existing
  .xattr-list
- pass pathname to do_setxattrs()

v1:
- move xattr unmarshaling to CPIO parser

Danny Hu (1):
  ima: skip algorithm availability check until initramfs unpacking is
    finished

Mimi Zohar (1):
  initramfs: add file metadata

Roberto Sassu (2):
  initramfs: read metadata from special file METADATA!!!
  gen_init_cpio: add support for file metadata

 include/linux/initramfs.h             |  19 +++
 init/initramfs.c                      | 140 ++++++++++++++++-
 security/integrity/ima/ima_appraise.c |  25 +++
 usr/Kconfig                           |  19 +++
 usr/Makefile                          |   3 +-
 usr/gen_init_cpio.c                   | 216 ++++++++++++++++++++++----
 usr/gen_initramfs.sh                  |  15 +-
 7 files changed, 401 insertions(+), 36 deletions(-)
 create mode 100644 include/linux/initramfs.h


base-commit: 2c3ba1f1cb416b81d617b92a24a4bcaa48d574e3
-- 
2.51.0

