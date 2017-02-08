Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:51343 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751606AbdBHDMh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Feb 2017 22:12:37 -0500
From: changbin.du@intel.com
Subject: [PATCH v2 0/2] kconfig/mconf: propagate jumping function in search result view
Date: Wed,  8 Feb 2017 11:09:37 +0800
Message-Id: <20170208030939.10146-1-changbin.du@intel.com>
In-Reply-To: <20170206074648.23896-1-changbin.du@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, corbet@lwn.net
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jim.epost@gmail.com, jani.nikula@linux.intel.com, Changbin Du <changbin.du@intel.com>

From: Changbin Du <changbin.du@intel.com>

While I am searching something in menuconfig, I hope if I can jump to interested
items directly. I even try to add this feature. When I check the code just found 
it has already been there but not documented. So why let more developers know it?

v2: correct spell (Jim)
   
Changbin Du (2):
  kconfig/mconf: add jumping tip in title of search result textbox
  Documentation/kconfig: add search jump feature description

 Documentation/kbuild/kconfig.txt | 4 ++++
 scripts/kconfig/mconf.c          | 8 ++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.7.4

