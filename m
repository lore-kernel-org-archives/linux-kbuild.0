Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:55265 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752322AbaHHNbJ convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:2:1>);
	Fri, 8 Aug 2014 09:31:09 -0400
Message-Id: <53E4ECDE020000780002A9A8@mail.emea.novell.com>
Date: Fri, 08 Aug 2014 14:29:34 +0100
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: firmware: fix build of external firmware
References: <53E34DDC020000780002A045@mail.emea.novell.com>
 <53E4CEA1.8090207@suse.cz>
In-Reply-To: <53E4CEA1.8090207@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

>>> On 08.08.14 at 15:20, <mmarek@suse.cz> wrote:
> On 2014-08-07 09:58, Jan Beulich wrote:
>> It looks like commit 5180d5f483 ("firmware: Simplify directory
>> creation") uncovered a latent bug: The cmd_fwbin make macro, which is
>> being called without any arguments, referenced argument 2, which I
>> suppose previously just happened to be set to the right value (from an
>> enclosing macro invocation - some make versions don't always properly
>> clear unused macro arguments on nested macro invocations). In 3.16 with
>> such make versions it now points into the source tree instead,
>> resulting in build failure when building outside the source tree. And
>> obviously on make versions properly clearing unused arguments it would
>> have resolved to empty.
> 
> With which make version are you seeing the error?

3.80 and 3.81, albeit with the latter I can't construct a simple
repro Makefile to demonstrate the problem (hence the mentioning
of "make versions" _and_ "don't always").

Jan

