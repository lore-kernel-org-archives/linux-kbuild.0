Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56718 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753516Ab3KLMw0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Nov 2013 07:52:26 -0500
Message-ID: <52822486.9090209@suse.cz>
Date: Tue, 12 Nov 2013 13:52:22 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [patch 1/1] deb-pkg: Add device tree blobs to the package
References: <20131107151746.950612598@rtp-net.org> <1383921387.8136.30.camel@deadeye.wl.decadent.org.uk>
In-Reply-To: <1383921387.8136.30.camel@deadeye.wl.decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>

On 8.11.2013 15:36, Ben Hutchings wrote:
> On Thu, 2013-11-07 at 16:17 +0100, Arnaud Patard wrote:
>> When building a package with make deb-pkg (say, for arm), the dtb files are
>> not added to the package. Given that things are still evolving on arm, it
>> make sense to have them along with the kernel and modules.
>>
>> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
>> ---
>>
>> Index: linux-next/scripts/package/builddeb
>> ===================================================================
>> --- linux-next.orig/scripts/package/builddeb	2013-11-06 12:51:49.548299578 +0100
>> +++ linux-next/scripts/package/builddeb	2013-11-06 12:52:24.152298055 +0100
>> @@ -140,6 +140,10 @@ if [ -e $KBUILD_IMAGE ]; then
>>  else
>>  	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
>>  fi
>> +if grep -q "^CONFIG_OF=y" .config ; then
>> +	mkdir -p "$tmpdir/usr/lib/$packagename"
>> +	find arch/$ARCH -name *.dtb -exec cp {} "$tmpdir/usr/lib/$packagename" \;
>> +fi
> 
> I would quote the '*.dtb'.  Otherwise I think this is reasonable.

Good catch. Arnaud, can you send a v2 with this fix?

Thanks,
Michal

