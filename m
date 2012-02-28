Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35233 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755600Ab2B1IKm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Feb 2012 03:10:42 -0500
Received: by daed14 with SMTP id d14so2073912dae.19
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Feb 2012 00:10:42 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 28 Feb 2012 16:10:42 +0800
Message-ID: <CAF8raN5YcDy9o_C=Nki6QaYphKUWQnf0uZ-1rhmcFPu+tBm4cA@mail.gmail.com>
Subject: [PATCH] kbuild: incremental tags update for GNU Global
From: Jianbin Kang <kjbmail@gmail.com>
Content-Type: multipart/mixed; boundary=e89a8ffba93f6043ed04ba01c3bb
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

--e89a8ffba93f6043ed04ba01c3bb
Content-Type: text/plain; charset=ISO-8859-1

GNU gtags support '-i' for updating tag files incrementally.
It runs more quickly than generating new tags after kernel source update.

Signed-off-by:  Jianbin Kang <kjbmail@gmail.com>
---
 scripts/tags.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 833813a..0bc8588 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -116,7 +116,7 @@ docscope()

 dogtags()
 {
-	all_sources | gtags -f -
+	all_sources | gtags -i -f -
 }

 exuberant()
-- 
1.7.9.1

--e89a8ffba93f6043ed04ba01c3bb
Content-Type: text/x-patch; charset=US-ASCII; name="gtags.patch"
Content-Disposition: attachment; filename="gtags.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gz6o2zsa0

LS0tCiBzY3JpcHRzL3RhZ3Muc2ggfCAgICAyICstCiAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL3RhZ3Muc2ggYi9z
Y3JpcHRzL3RhZ3Muc2gKaW5kZXggODMzODEzYS4uMGJjODU4OCAxMDA3NTUKLS0tIGEvc2NyaXB0
cy90YWdzLnNoCisrKyBiL3NjcmlwdHMvdGFncy5zaApAQCAtMTE2LDcgKzExNiw3IEBAIGRvY3Nj
b3BlKCkKIAogZG9ndGFncygpCiB7Ci0JYWxsX3NvdXJjZXMgfCBndGFncyAtZiAtCisJYWxsX3Nv
dXJjZXMgfCBndGFncyAtaSAtZiAtCiB9CiAKIGV4dWJlcmFudCgpCi0tIAoxLjcuOS4xCgo=
--e89a8ffba93f6043ed04ba01c3bb--
