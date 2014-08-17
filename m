Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:23092 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751332AbaHQPFV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Aug 2014 11:05:21 -0400
Date: Mon, 18 Aug 2014 00:05:02 +0900 (JST)
Message-Id: <20140818.000502.1530201188174773807.yamato@redhat.com>
Subject: Re: v flags/modifiers in scripts/tags.sh
From: Masatake YAMATO <yamato@redhat.com>
In-Reply-To: <gh61htovas.fsf@quad.gouders.net>
References: <20140815.134310.1330792325830869384.yamato@redhat.com>
	<gh61htovas.fsf@quad.gouders.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dirk@gouders.net
Cc: linux-kbuild@vger.kernel.org

On Sat, 16 Aug 2014 07:30:51 +0200, Dirk Gouders <dirk@gouders.net> wrote:
> Masatake YAMATO <yamato@redhat.com> writes:
> 
>> Hi,
>>
>> I have a question about v flags/modifiers in scripts/tags.sh.
>>
>> quoted from scripts/tags.sh:
>>
>>     exuberant()
>>     {
>> 	    ...
>> 	    --regex-c='/DEFINE_(MUTEX|SEMAPHORE|SPINLOCK)\((\w*)/\2/v/'	\
>> 	    ...
>>     }
>>
>>     emacs()
>>     {
>> 	    ...
>> 	    --regex='/DEFINE_HASHTABLE\((\w*)/\1/v/'
>> 	    ...
>>     }
>>
>>
>> v is specified at the end of the regular expressions.
>>
>> As far as I read the man pages of ctags and etags.  there is no such
>> flags/modifiers. What is v?
>>
>> (I am a co-maintainer of fishman-ctags, a fork of exuberant-ctags.
>>  So I'm interested in implementing v flags in ctags if it is useful.)
> 
> 'v' is called a 'kind-spec' in exuberant ctags/etags; the emacs
> incarnations don't know about it and actually produce warnings.
> 
> As you are co-maintaining a fork of exuberant-ctags, I wonder if your
> fork probably already knows about kind-specs.


man ctags:
       ...
       --regex-<LANG>=/regexp/replacement/[kind-spec/][flags]
            The /regexp/replacement/ pair define a regular expression replacement pattern, similar in style  to  sed
        ...

I misunderstood it as a flag. I now understood it means variable.
Sorry for making noise.

Masatake YAMATO
