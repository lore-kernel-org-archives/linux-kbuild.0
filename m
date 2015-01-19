Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([195.154.106.105]:42939 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873AbbASXOH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Jan 2015 18:14:07 -0500
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
References: <20150114123201.434698327@rtp-net.org>
	<20150114123658.185884720@rtp-net.org>
	<1421239885.19708.82.camel@decadent.org.uk>
Date: Tue, 20 Jan 2015 00:13:35 +0100
In-Reply-To: <1421239885.19708.82.camel@decadent.org.uk> (Ben Hutchings's
	message of "Wed, 14 Jan 2015 12:51:25 +0000")
Message-ID: <87lhkyictc.fsf@lebrac.rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>

Ben Hutchings <ben@decadent.org.uk> writes:

> [Please submit patches inline.]

I've no way to control the way quilt is sending mails.

>
> On Wed, 2015-01-14 at 13:32 +0100, Arnaud Patard wrote:
>> When building a package with make deb-pkg (say, for arm), the dtb files are
>> not added to the package. Given that things are still evolving on arm, it
>> make sense to have them along with the kernel and modules.
>> 
>> v2: make use of dtbs_install
>> 
>> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
>> ---
>> 
>> Index: linux-next/scripts/package/builddeb
>> ===================================================================
>> --- linux-next.orig/scripts/package/builddeb    2015-01-14 13:04:45.845922441 +0100
>> +++ linux-next/scripts/package/builddeb 2015-01-14 13:19:26.121883720 +0100
>> @@ -143,6 +143,10 @@ else
>>         cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
>>  fi
>>  
>> +if grep -q "^CONFIG_OF=y" .config ; then
>> +       make INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
>> +fi
>
> Only arm and arm64 support that target.  You should maybe run something
> like 'make -n dtbs_install >/dev/null 2>&1' first to check that the
> target is defined.

There's a 'set -e' on top of the script so using make -n will likely
result in the script failing, which wouldn't be so nice imho.

From a quick untested guess, I see 2 way of solving this:

make INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install || /bin/true

or

set +e
make -n dtbs_install >/dev/null 2>&1
ret=$?
set -e
if [ $ret -eq 0 ]; then
   make INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
fi

Any preference ?

Arnaud
