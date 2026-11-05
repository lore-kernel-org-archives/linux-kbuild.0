Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907476;
	b=sX7jdYkHL2cSIiC+Txjd1XlC+fCZsHQ8K4PIp6W7x50pG5pwcdqKOmpp32LuNoaQHiop
	 FOxPBtQxsYsyCuhYYqH7U9+JZeSHZEBTMkjSitqgMrQC9BHrWHj2S0Yonb3XGBriqhOaj
	 PgwjdZ56YV0S4XbNW/JMPDWaKvZMa5X20QLLomKyvtlad2Yngbsi1+EJ5002qEcs6PQ98
	 On1j18u8iO+DuEAp8INxbRyr6ovbOSJNi28htmpT6Bt4amoNjqe3fIA/NQI6HCYiUuWqm
	 13a/FU4Ao3kbz75yyopEh9kzZ3wjSxkYkutDlU8oj6zP+qBtohk0T8GoIIAPSWw46LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3ALiLRgUIlPUP7r35NUTeM7wiuqIXdzicUpxLmxb19E=;
	b=H7YL2tV+CiYvuX+U5cqd2DdVKGHFcF9xkvScgTwjZakSUTXdpUBcDQqNHx64sW2cSQeP
	 TJH127rSVJFuqEH/v6+Y87QpI5BIWSn1ZGDDBzZg3w47YA+2Abvon++mKhiuwWuMe3yrA
	 VCQeI1eJHONLcpeH2Zi8yN3i+bUe58btDsyN2yXlhM8K5UeRpx3yko0s3Ket7KwtiRzDf
	 RDrwZp+OOGMjh0f7NZ1Qt580nvI3uSt+GuIi1SpW3W6w//cgrQly8M5ItZjNAHeLE6Wug
	 1AmugBGk+oSEPejMOHHbRdYeUW+V+FFpKfqnvn1+aUTaYbISzIDPe+j67f8gZna9R3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=CtJWa3tE;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC95606C891
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 19:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC95606C891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=CtJWa3tE
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36d6765756fso2917123eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 11:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1793907474; x=1794512274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ALiLRgUIlPUP7r35NUTeM7wiuqIXdzicUpxLmxb19E=;
        b=CtJWa3tEL/dQ/RdyYOmPv2dc/ZxWSmCzdkel6b5w4cFqUR8L8Yi6Jqvw3+gCKmj1Wb
         8F2PKydr3mpYlrF8QH3i7YW/bayrWHul9bNjqh+POZbqKFiRA8ayJ67ofnOCXF+sQIcp
         mYJ3+ovEP8dkI6pcu9/gDn0ViYnsz86zDwEZdGq/yHQDWuWIqJN+tcZFgE8J/4OINklC
         A3S8WWTFwSLWNOiYD0tjjK366TSXcc98utBOaoeROKpMMcYhCu2LFzpCHZWbEUJoLF8+
         hpvZa1olcHLdvPqnS1eJtevWQK3BISF3T9V9gHs6DqgAFfkmwshhrXpzShEuswdCN2pq
         U8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907474; x=1794512274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ALiLRgUIlPUP7r35NUTeM7wiuqIXdzicUpxLmxb19E=;
        b=zQ9AMKtFu4kUxaGO2+6dUfDRkBCpAb4LKeXdbdOjVkmEzawWbDFPFcc+WO0z/DVm3T
         +wp8yIlxlWIhHBIKEVAUmhuqiTfmJXl1cxBjBR97ECQ04mOjLfpW/hllGshjZwEMK3Sy
         HPV3B2KFVnRheYuZsWH7fqESspnYKlCn+Tus8jDq+gFgadb49SVU9BnweH5/Ygk6FZzX
         jmvpAMVL2WLzW+wq3RD6aVOIrTDtlt81d+h691JbDO+eehhUt287TvmvIV+SDshCH4n4
         1ZSy6vdlrLsgiEosomqnnTLij2znZy5cftA3JBXvJ0elIjajOJmdNJZkSt2iQF43Gk9e
         SD6w==
X-Forwarded-Encrypted: i=1; AKwUvBzmdIQGMwsoT21+fh6lAofoFUsR1BHb4DxCVyesdtW7QTVNfDH1zzawpVjqnPIqRO8v43hlnUhOvcCasvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A3tmkF+BEmRFgCbH5kCjCnivq+mJrzbpX5HuafahEo+jWLua6
	44AaNblYvy8iGtOY8QEElpEDjXFyyzCaQc1J67freOustw83B8JoRUiQyvbjYpcduw==
X-Gm-Gg: AYBFou1mj7dK2kfglP+OVg6FecKSV2WU7YVVznztW9KxDIvVD2fFJ/kkNt/tBMqLoKJ
	kvOB6f5R3FNEPlu+6agN3RZuARtqgguW0zjn1s0rLniwwUtG9g5bJmhZ+XbxLV3Zb1ONP3mbtFn
	h+0ZrGFFeYPXezVJP9Pg0FYyh11fI6u+isjP6kYw7bKLxQyiW49IQ838UIZ+sNbZqfSP/6ubuGP
	dUU5J3cbgLFJZE8z5iSLmYtsLN/uMb/2OvdOcnoVk0LgF9XWMp3/U2VI1jIqWI9cj79hW9FbJoI
	GXcgjcPsFFCLECYna4RLm0fYv6nGaKH5ZtgPWtmOofGcnDcWBzsPUit1/oHuzj+sDRCf3c7pM6f
	ZzrQF+ceScluxE0mDoOojI1E/j8kJjKqY51nkrwSPB0U3+dMeOKBCUF0o5zAfwjODhtXjd8tYMa
	kaT9Eeu/jkzCkbGp7pplqnlKc7RQGpBe4Ta0lDEBIsCMSPBlkfK/vw5E1lQV6CqHx+g55rf2F1x
	3uYRNiLfPUK+f4dRlGPJSy3HA7kItHAgaenr2G6TwQQXniSlhSd33OANK1QCfvJvjgYfdRUgxD9
	0YccSdfr9XnmvXonyueVVr4Ew/TvuZjMxcPbt2swzdqCqUwmZ5E7D8NsudYDWMZYaL3NR4wViKi
	c578LFymgWF5gwnnrnGeJ4UI=
X-Received: by 2002:a05:693c:40c8:b0:36d:2b02:86a6 with SMTP id 5a478bee46e88-36f72cc1ae3mr274930eec.4.1793907473472;
        Thu, 05 Nov 2026 11:37:53 -0800 (PST)
Received: from dannyhu-upstreamLinux.sjc.aristanetworks.com ([74.123.28.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72ec8a02sm326134eec.11.2026.11.05.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:37:53 -0800 (PST)
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
Subject: [PATCH v6 0/4] initramfs: add support for xattrs in the initial ram disk
Date: Thu,  5 Nov 2026 11:37:39 -0800
Message-ID: <20261105193743.2654656-1-dannyhu@arista.com>
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

The changes in v6 address issues identified by the Sashiko AI review.
v5 revision:
https://lore.kernel.org/linux-fsdevel/20261030210944.2143778-1-dannyhu@arista.com/.
The major difference from v5 is that this revision introduces a new state
in the initramfs parser that specifically handles buffering metadata entries
in memory. This has the benefit of preventing a metadata file from being
created in the rootfs, eliminating the need for a metadata flag and
separates metadata collection from do_copy. Sashiko identified the lack of
support for POSIX ACL xattr restoration; while this is true, the primary
use case of this feature is restoration of the security.ima xattr for IMA.
Therefore, POSIX ACL xattr restoration is out of scope for this patchset
and can be implemented later on when needed. This revision also adds xattr
length validation, bounds checks that prevent overflow, improvements to
tracking of the metadata target and fixes to gen_init_cpio to handle a
NULL ptr and to define the __packed macro.

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
kernels would require adapting adding the dedicated CollectMetadata state
along with the pathname target tracking. From the user space perspective,
unlike the previous version of the patch set, it is required to modify the
image generators in order to include metadata as separate files.

Changelog

Changes in v6:
- Document that POSIX ACL restoration is currently unsupported
- Validate xattr name and value lengths and compare metadata header and
  entry sizes to remaining buffer when performing bounds checks to avoid
  pointer arithmetic overflow
- Introduce a dedicated CollectMetadata state to consume METADATA!!!
  entries in memory. This replaces the metadata flag and avoids creating
  the metadata entry as a file in the rootfs.
- Verify metadata entry checksums before restoring xattrs
- Initialize and improve tracking of the previous_name_buf so skipped or failed
  entries do not leave an uninitialized or stale metadata target
- Fix gen_init_cpio handling NULL path ptr and define __packed before
  including the shared metadata header

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
 init/initramfs.c                      | 206 ++++++++++++++++++++++--
 security/integrity/ima/ima_appraise.c |  25 +++
 usr/Kconfig                           |  19 +++
 usr/Makefile                          |   3 +-
 usr/gen_init_cpio.c                   | 221 ++++++++++++++++++++++----
 usr/gen_initramfs.sh                  |  15 +-
 7 files changed, 460 insertions(+), 48 deletions(-)
 create mode 100644 include/linux/initramfs.h


base-commit: 2c3ba1f1cb416b81d617b92a24a4bcaa48d574e3
-- 
2.51.0

