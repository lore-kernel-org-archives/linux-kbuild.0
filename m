Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:34568 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832AbbINERV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 00:17:21 -0400
Received: by ykdg206 with SMTP id g206so141793875ykd.1
        for <linux-kbuild@vger.kernel.org>; Sun, 13 Sep 2015 21:17:20 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 14 Sep 2015 01:17:20 -0300
Message-ID: <CA+ToGPHBHz1k1CTEoA0TsK_g+TPw6yhJJYgRVTOJS2vc-CAKbQ@mail.gmail.com>
Subject: What would it take to port xconfig to Qt5 and gconfig to GTK+ 3?
From: Diego Viola <diego.viola@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I would like to help with this and try to port one or the other to the
latest toolkits so that we can remove "X windows" from the README.

I.e.,

I want to replace this:

"make xconfig"     X windows (Qt) based configuration tool.

"make gconfig"     X windows (GTK+) based configuration tool.

With this:

"make qconfig"     Qt based configuration tool.

"make gconfig"     GTK+ based configuration tool.

And perhaps keep an alias xconfig to qconfig for backwards
compatibility. Does it makes sense?

The reason I want to remove "X windows" from the README is that those
toolkits are no longer dependent on X, there's also Wayland now.

Do any of those work with Qt5/GTK+3 at the moment?

Thanks,

Diego
