Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:36748 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbeICOWw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Sep 2018 10:22:52 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 3/3] kbuild: rpm-pkg: set KCONFIG_NONINTERACTIVE_UPDATE
Date: Mon,  3 Sep 2018 19:01:56 +0900
Message-Id: <1535968916-9159-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
References: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>, Laura Abbott <labbott@redhat.com>, Jiri Kosina <jkosina@suse.cz>, Ben Hutchings <ben.hutchings@codethink.co.uk>, =?UTF-8?q?Michal=20Such=8F=AB=A1nek?= <msuchanek@suse.de>, Takashi Iwai <tiwai@suse.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Prevent "make syncconfig" from prompting user inputs when new symbols
become available due to build environment changes.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/mkspec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index f72c46a..86986c1 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -87,7 +87,7 @@ $S	%prep
 $S	%setup -q
 $S
 $S	%build
-$S	make %{?_smp_mflags} ARCH=$ARCH KBUILD_BUILD_VERSION=%{release}
+$S	make %{?_smp_mflags} ARCH=$ARCH KBUILD_BUILD_VERSION=%{release} KCONFIG_NONINTERACTIVE_UPDATE=1
 $S
 	%install
 	mkdir -p %{buildroot}/boot
-- 
2.7.4
