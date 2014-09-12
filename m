Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:65396 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751056AbaILWcO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Sep 2014 18:32:14 -0400
From: Martin Walch <walch.martin@web.de>
Subject: kconfig: NEW: syntax highlighting for Kconfig files in KDE
Date: Sat, 13 Sep 2014 00:32:09 +0200
Message-ID: <27129446.btpinNW7pO@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

The text editors in KDE (Kate, KWrite, KDevelop, etc.) now support
highlighting Kconfig files. This will ship with KDE SC 4.14.1, older versions
back to KDE 4.4.0 can easily get it by running Kate and using the download
dialog at >Settings >Configure Kate... >Editor Component: Open/Save
>Modes & Filetypes >Download Highlighting Files...

Kate automatically applies this highlighting style to all files with names
that start with "Kconfig" unless some other pattern applies (e.g. *.c).

The highlighting should be pretty accurate with the usual formatting
scheme that most syntax highlighters of KDE apply and it comes with code
folding support and spell checking. However, it still lacks an indenter.
It also has no other fancy stuff like accurate auto-completion or jumping
to a declaration.

While the infrastructure of Kate Part primarily targets highlighting
syntactically valid files (not caring about invalid syntax), this highlighter
also underlines anything that will lead to a syntax error when running *conf.
Bad characters that do not lead up to a syntax error, but which will be
silently ignored, are red with a light red background.

This all comes at the cost of rather high cpu usage. You may notice when
loading large files, depending on your hardware. Also, automatic spell
checking on large files may slow things down. If you intend to open hundreds
of Kconfig files at once, expect it to take a long time.

Please report bugs either to me via email (subject start [kconfig.xml]) or
in the bug tracker of KDE at https://bugs.kde.org/

Regards
Martin Walch
-- 

