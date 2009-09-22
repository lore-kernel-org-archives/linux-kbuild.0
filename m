Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:58748 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756656AbZIVPIy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2009 11:08:54 -0400
Message-ID: <4AB8E887.1020507@tuffmail.co.uk>
Date: Tue, 22 Sep 2009 16:08:55 +0100
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] kbuild: sort the list of symbols exported by the
 kernel (__ksymtab)
References: <1253626718-18887-1-git-send-email-alan-jenkins@tuffmail.co.uk> <1253626718-18887-3-git-send-email-alan-jenkins@tuffmail.co.uk> <20090922144819.GB29949@merkur.ravnborg.org>
In-Reply-To: <20090922144819.GB29949@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-modules@vger.org

Sam Ravnborg wrote:
> On Tue, Sep 22, 2009 at 02:38:36PM +0100, Alan Jenkins wrote:
>   
>> modpost of vmlinux.o now extracts the ksymtab sections and outputs
>> sorted versions of them as .tmp_exports.c.  These sorted sections
>> are linked into vmlinux and the original unsorted sections are
>> discarded.
>>
>> This will allow modules to be loaded faster, resolving symbols using
>> binary search, without any increase in the memory needed for the
>> symbol tables.
>>
>> This does not affect the building of modules, so hopefully it won't
>> affect compile times too much.
>>     
>
> I do not quite follow you here.
>
> With your patch:
>
> For vmlinux we define our symbols in sections
> named *_sorted - but they are not sorted.
>
> We than create a small .c file that uses the original sections names
> which is what is used in the final vmlinux.
>   

Actually it's intended to work the other way round.

EXPORT_SYMBOL() generates symbols in __ksymtab as usual.  These get as
far as vmlinux.o before I start changing anything.

My .c file then uses __EXPORT_SYMBOL_SORTED() to generate symbols in
__ksymtab_sorted (or __ksymtab_gpl_sorted etc.), based on the symbols in
vmlinux.o.  So the _sorted sections _are_ sorted.

Finally, I changed the vmlinux linker script to effectively rename
__ksymtab_sorted and discard the original unsorted __ksymtab.

I hope that clears that up.

> Could we replace the content of these sections rather than playing
> games with the names?
>
> 	Sam
>   

Thinking about it, I guess I could avoid using new section names.  I
could change the vmlinux linker script to discard all __ksymtab
sections, _except_ those which came from the file .tmp_exports.o.  (And
maybe rename .tmp_exports.o to .tmp_sorted_exports.o to make it more
obvious).

That would avoid the need to add separate __EXPORT_SYMBOL_NAME() and
__EXPORT_SYMBOL_SORTED().  OTOH, it means the linker script uses more
features and is more tightly coupled to the build system.  I.e. the
script references a specific file.

I prefer my original method, but I can change it if you disagree :-).

Thanks!
Alan
