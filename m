Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:47695 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750816AbaHPFbj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Aug 2014 01:31:39 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: v flags/modifiers in scripts/tags.sh
In-Reply-To: <20140815.134310.1330792325830869384.yamato@redhat.com> (Masatake
	YAMATO's message of "Fri, 15 Aug 2014 13:43:10 +0900 (JST)")
References: <20140815.134310.1330792325830869384.yamato@redhat.com>
Date: Sat, 16 Aug 2014 07:30:51 +0200
Message-ID: <gh61htovas.fsf@quad.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masatake YAMATO <yamato@redhat.com>
Cc: linux-kbuild@vger.kernel.org

Masatake YAMATO <yamato@redhat.com> writes:

> Hi,
>
> I have a question about v flags/modifiers in scripts/tags.sh.
>
> quoted from scripts/tags.sh:
>
>     exuberant()
>     {
> 	    ...
> 	    --regex-c='/DEFINE_(MUTEX|SEMAPHORE|SPINLOCK)\((\w*)/\2/v/'	\
> 	    ...
>     }
>
>     emacs()
>     {
> 	    ...
> 	    --regex='/DEFINE_HASHTABLE\((\w*)/\1/v/'
> 	    ...
>     }
>
>
> v is specified at the end of the regular expressions.
>
> As far as I read the man pages of ctags and etags.  there is no such
> flags/modifiers. What is v?
>
> (I am a co-maintainer of fishman-ctags, a fork of exuberant-ctags.
>  So I'm interested in implementing v flags in ctags if it is useful.)

'v' is called a 'kind-spec' in exuberant ctags/etags; the emacs
incarnations don't know about it and actually produce warnings.

As you are co-maintaining a fork of exuberant-ctags, I wonder if your
fork probably already knows about kind-specs.

Anyway, because of your question, I noticed some more problems with the
emacs part of tags.sh; patches coming shortly.

Dirk

>
> Masatake YAMATO
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
