Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:53916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750835AbdAWPFW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 10:05:22 -0500
MIME-Version: 1.0
In-Reply-To: <20170123150235.GA26884@kroah.com>
References: <20170118173156.16060-1-mcgrof@kernel.org> <20170119101507.GA18592@kroah.com>
 <20170123145952.GM13946@wotan.suse.de> <20170123150235.GA26884@kroah.com>
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Date: Mon, 23 Jan 2017 09:04:44 -0600
Message-ID: <CAB=NE6WFRqFnCsY=EnfzBAKDeUDqfUgUNxZsVB-VBxy-QL5C9Q@mail.gmail.com>
Subject: Re: [PATCH] firmware/Makefile: force recompilation if makefile changes
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ming Lei <ming.lei@canonical.com>, Daniel Wagner <wagi@monom.org>, David Woodhouse <dwmw2@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

On Mon, Jan 23, 2017 at 9:02 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Mon, Jan 23, 2017 at 03:59:52PM +0100, Luis R. Rodriguez wrote:
>> On Thu, Jan 19, 2017 at 11:15:07AM +0100, Greg KH wrote:
>> > On Wed, Jan 18, 2017 at 09:31:56AM -0800, Luis R. Rodriguez wrote:
>> > > If you modify the target asm we currently do not force the
>> > > recompilation of the firmware files. The target asm is in
>> > > the firmware/Makefile, peg this file as a dependency to
>> > > require re-compilation of firmware targets when the asm
>> > > changes.
>> >
>> > Why would changing the Makefile require the asm to change?
>>
>> The Makefile is the file that provides the assembly logic, so
>> changing the asm should affect recreating the binary.
>
> Ah, I see it now, that's horrid, echoing asm from the Makefile itself :)

Yeah, I can change the way that works but I think I would much prefer
to make that a separate atomic functional change.

  Luis
