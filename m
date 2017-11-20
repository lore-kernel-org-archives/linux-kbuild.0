Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:55598 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdKTWjp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 17:39:45 -0500
From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 0/2] Documentation: Add guidance on CONFIG default value
Date: Mon, 20 Nov 2017 14:39:32 -0800
Message-Id: <cover.1511217248.git.dvhart@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Darren Hart (VMware)" <dvhart@infradead.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Document the preference for "default n" in kconfig-language.txt, and reference
that in the submit-checklist.rst.

Darren Hart (VMware) (2):
  Documentation/kbuild: Add guidance for the use of default
  Documentation/process: Add CONFIG default value to submit-checklist

 Documentation/kbuild/kconfig-language.txt  | 21 +++++++++++++++++++++
 Documentation/process/submit-checklist.rst |  4 +++-
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.9.4

