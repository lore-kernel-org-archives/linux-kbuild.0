Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:54170 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751355Ab1KVGZF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Nov 2011 01:25:05 -0500
Received: by wwe5 with SMTP id 5so11901956wwe.1
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 22:25:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1321915691.6445.29.camel@work-vm>
References: <1321567131.25715.32.camel@work-vm>
	<1321685490-11706-1-git-send-email-lacombar@gmail.com>
	<1321915691.6445.29.camel@work-vm>
Date: Tue, 22 Nov 2011 01:25:04 -0500
Message-ID: <CACqU3MUzc3vQqKZQ2er19mT_oGYBTy_i65ckBkqxEPL5-z9y7Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: john stultz <johnstul@us.ibm.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi,

On Mon, Nov 21, 2011 at 5:48 PM, john stultz <johnstul@us.ibm.com> wrote:
> On Sat, 2011-11-19 at 01:51 -0500, Arnaud Lacombe wrote:
>> You'll find below some more nits
>>
>> 1) bail out early on error.
>
> Actually, I spoke a little too soon.
>
> The set -e option causes us to bomb out if grep doesn't find a config
> option (grep returns 1 if nothing is found). So I'll have to drop that
> change for now.
>
because the way the return value of grep(1) is checked is bogus. It
should not be:

    grep -q -w $CFG $TMP_FILE
    if [ $? -eq 0 ] ; then
        ...
    fi

but:

    if grep -q -w $CFG $TMP_FILE ; then
        ...
    fi

that way, you can still keep the `set -e'. IMHO, it should be set by
default for any shell script, just as a safety net, as `set -u'.

 - Arnaud
