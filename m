Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:50207 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbfHLSAb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 14:00:31 -0400
Date: Mon, 12 Aug 2019 20:00:26 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: can we use mandatory-y for non-uapi headers?
Message-ID: <20190812180026.GA15574@lst.de>
References: <20190810075226.GA24085@lst.de> <CAK7LNAQfQWNMMLS1-3mE41Ffy3MV9i3VpbWtmKQdUqZjyk8Yqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQfQWNMMLS1-3mE41Ffy3MV9i3VpbWtmKQdUqZjyk8Yqg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 13, 2019 at 12:41:20AM +0900, Masahiro Yamada wrote:
> > what is the reason that the documentation says mandatory-y should only
> > be used for uapi headers?
> 
> Where is it documented?
> 
> Documentation/kbuild/makefiles.rst section 7.4 describes
> mandatory-y is essentially used by include/(uapi/)asm-generic/Kbuild
> 
> include/(uapi/)asm-generic/Kbuild means:
> 
> include/uapi/asm-generic/Kbuild
> include/asm-generic/Kbuild

Ok, maybe it was just me misreading the documentation.  In that
case I'll start submitting patches to use it more.
