Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:38043 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943AbZFEL3E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 07:29:04 -0400
Message-ID: <4A2900E9.1050005@gmail.com>
Date: Fri, 05 Jun 2009 14:26:33 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
Subject: Re: [Patch] kbuild: fix headers_check.pl
References: <20090605021419.7905.89870.sendpatchset@localhost.localdomain> <200906051021.51726.arnd@arndb.de>
In-Reply-To: <200906051021.51726.arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Amerigo Wang <amwang@redhat.com>, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

Arnd Bergmann wrote:
> On Friday 05 June 2009, Amerigo Wang wrote:
>> -sub check_prototypes
>> +sub check_declarations
>>  {
>> -       if ($line =~ m/^\s*extern\b/) {
>> -               printf STDERR "$filename:$lineno: extern's make no sense in userspace\n";
>> +       if ($line =~m/^\s*extern\b/) {
>> +               if ($line =~ m/^\s*extern\b.*\(.*\)/) {
>> +                       printf STDERR "$filename:$lineno: extern's make no sense in userspace\n";
>> +               } else {
>> +                       printf STDERR "$filename:$lineno: exporting global variable to userspace is suspicious\n";
>> +               }
>>         }
>>  }
> 
> I don't think we really need that distinction here, the old
> text applies to both. But please find a way to get rid of
> the "extern's".
> 
> http://angryflower.com/bobsqu.gif

Hehe, made me smile :-)
