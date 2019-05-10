Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:33007 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfEJHcx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 03:32:53 -0400
Date: Fri, 10 May 2019 15:32:07 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH kbuild] kbuild: kunit_stream_get_level() can be static
Message-ID: <20190510073207.GA2325@lkp-kbuild06>
References: <201905101508.nymn1QP2%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201905101508.nymn1QP2%lkp@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>


Fixes: 7ab313d288d1 ("kbuild: enable building KUnit")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 kunit-stream.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kunit/kunit-stream.c b/kunit/kunit-stream.c
index 93c14ee..3d92646 100644
--- a/kunit/kunit-stream.c
+++ b/kunit/kunit-stream.c
@@ -11,7 +11,7 @@
 #include <kunit/kunit-stream.h>
 #include <kunit/string-stream.h>
 
-const char *kunit_stream_get_level(struct kunit_stream *this)
+static const char *kunit_stream_get_level(struct kunit_stream *this)
 {
 	unsigned long flags;
 	const char *level;
