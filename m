Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49924 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728110AbeIFNxY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 09:53:24 -0400
Subject: [PATCH 04/11] UAPI: bcache: Fix use of embedded flexible array [ver
 #2]
From: David Howells <dhowells@redhat.com>
Date: Thu, 06 Sep 2018 10:18:51 +0100
Message-ID: <153622553109.14298.2675151087019716165.stgit@warthog.procyon.org.uk>
In-Reply-To: <153622549721.14298.8116794954073122489.stgit@warthog.procyon.org.uk>
References: <153622549721.14298.8116794954073122489.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Coly Li <colyli@suse.de>, Kent Overstreet <kent.overstreet@gmail.com>, linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com

The bkey struct defined by bcache is embedded in the jset struct.  However,
this is illegal in C++ as there's a "flexible array" at the end of the
struct.  Change this to be a 0-length struct instead.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Coly Li <colyli@suse.de>
cc: Kent Overstreet <kent.overstreet@gmail.com>
cc: linux-bcache@vger.kernel.org
---

 include/uapi/linux/bcache.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/bcache.h b/include/uapi/linux/bcache.h
index 5d4f58e059fd..11863e903bff 100644
--- a/include/uapi/linux/bcache.h
+++ b/include/uapi/linux/bcache.h
@@ -23,7 +23,7 @@ static inline void SET_##name(type *k, __u64 v)			\
 struct bkey {
 	__u64	high;
 	__u64	low;
-	__u64	ptr[];
+	__u64	ptr[0];
 };
 
 #define KEY_FIELD(name, field, offset, size)				\
