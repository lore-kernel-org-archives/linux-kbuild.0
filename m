Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:49851 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfCJSuo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Mar 2019 14:50:44 -0400
Subject: Re: Debian build polishing
References: <1552049064-32044-1-git-send-email-info@metux.net>
 <20190308175703.GA7178@lambda>
 <fe53cd84-5953-786a-3a4f-6eac652a1cdd@metux.net>
 <20190308215724.GA22319@mit.edu>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <341b78ca-9901-78f0-f404-59194f3da503@metux.net>
Date: Sun, 10 Mar 2019 19:50:19 +0100
MIME-Version: 1.0
In-Reply-To: <20190308215724.GA22319@mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, "Enrico Weigelt, metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org

On 08.03.19 22:57, Theodore Ts'o wrote:

> The full debian directory lands in the O= directory.  So presumably
> you could make it work for use case if there was a "make O=/build/dir
> debian-prepare" which copies the necessary debian/ files into the
> build directory and then someone could cd into /build/dir and run
> "dpkg-buildpackage"?

Didn't touch these rules at all, so it should still work as it used to.

I thought about changing the old deb rules to just call the new
debian/rules file, but haven't done so yet.

Maybe you could find some time to test whether my approach also
works for you ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
