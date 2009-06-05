Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:57978 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751146AbZFEJWT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 05:22:19 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch] kbuild: fix headers_check.pl
Date: Fri, 5 Jun 2009 10:21:50 +0100
References: <20090605021419.7905.89870.sendpatchset@localhost.localdomain>
In-Reply-To: <20090605021419.7905.89870.sendpatchset@localhost.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200906051021.51726.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Amerigo Wang <amwang@redhat.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Friday 05 June 2009, Amerigo Wang wrote:
> -sub check_prototypes
> +sub check_declarations
>  {
> -       if ($line =~ m/^\s*extern\b/) {
> -               printf STDERR "$filename:$lineno: extern's make no sense in userspace\n";
> +       if ($line =~m/^\s*extern\b/) {
> +               if ($line =~ m/^\s*extern\b.*\(.*\)/) {
> +                       printf STDERR "$filename:$lineno: extern's make no sense in userspace\n";
> +               } else {
> +                       printf STDERR "$filename:$lineno: exporting global variable to userspace is suspicious\n";
> +               }
>         }
>  }

I don't think we really need that distinction here, the old
text applies to both. But please find a way to get rid of
the "extern's".

http://angryflower.com/bobsqu.gif

	Arnd <><
