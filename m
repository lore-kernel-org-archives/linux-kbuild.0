Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:58336 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752984AbZIWAcS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2009 20:32:18 -0400
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: module: Speed up symbol resolution during module loading
Date: Wed, 23 Sep 2009 10:02:15 +0930
References: <1253626112-18429-1-git-send-email-alan-jenkins@tuffmail.co.uk>
In-Reply-To: <1253626112-18429-1-git-send-email-alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200909231002.16759.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Cc: lkml@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-modules@vger.org

On Tue, 22 Sep 2009 10:58:28 pm Alan Jenkins wrote:
> The following series applies against v2.6.31. It sorts the tables of builtin
> symbols, so the module loader can resolve them using a binary search.
> 
> The kbuild changes to achieve this are less scary than I expected.  I'm
> optimistic that they can be accepted without radical alteration :-).
> 
> Quoting from the last patch in this series:
> 
> "On my EeePC 701, coldplug is mainly cpu bound and takes 1.5 seconds
> during boot. perf showed this change eliminated 20% of cpu cycles during
> coldplug, saving 0.3 seconds of real time.

Hi Alan,

   This seems useful, but wouldn't it be simpler to just sort at boot time?
The same could be done for modules, possibly reducing code.

Alternately, there's a standard way of hashing ELF symbols, but I'm not sure
we can convince the linker to generate it for vmlinux (I haven't looked
though).

Thanks!
Rusty.
