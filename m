Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cli-5b7ef064.bcn.adamo.es ([91.126.240.100]:62083 "HELO
        mail.sysvalve.es" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with SMTP id S965306AbeEXIr4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 May 2018 04:47:56 -0400
Date: Thu, 24 May 2018 10:47:55 +0200
From: =?iso-8859-1?Q?L=2E_Alberto_Gim=E9nez?= <agimenez@sysvalve.es>
Subject: Re: [PATCH] build: Exclude cscope and tags files from packaging
Message-ID: <20180524084754.GA10037@bart.evergreen.loc>
References: <20180517134838.8403-1-agimenez@sysvalve.es>
 <CAAqcGH=PuRgsDU81R5P=_JSvV+vVqntBO6ivEpY2v8AqKAuGsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAqcGH=PuRgsDU81R5P=_JSvV+vVqntBO6ivEpY2v8AqKAuGsQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, May 21, 2018 at 04:06:15PM +0300, Riku Voipio wrote:
> On 17 May 2018 at 16:48, L. Alberto Giménez <agimenez@sysvalve.es> wrote:
> > When building a Debian package, cscope and tags generated files are
> > accounted in the Debian packaging process, even causing some errors
> > under some circumstances (generating diff between "pristine" tar and
> > "patched sources").
> 
> Honestly you should use make mrproper, if you want to spin out source
> packages. If otoh you don't have a use for the source package, use
> bindeb-pkg.

Well, to be honest I just wanted a .deb file to distribute to my VM in order to test
and squash some bugs quickly, and in my machine, it was causing a recompilation every
time I tried to build a new package, (26 minutes withh allyes).

I just wanted to speed up things and avoid the full compilation that deb-pkg was
doing (and mrproper would cause anyway) if I already had everything done.

But I realized that bindeb-pkg does just what I want, so you can ignore this patch,
sorry for the inconvenience.


Regards,
-- 
L. Alberto Giménez
GnuPG key ID 0xDD4E27AB
