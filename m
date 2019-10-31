Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:37154 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfJaEcM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 00:32:12 -0400
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
 <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
 <20191031033722.GA7687@Gentoo>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <41693d0e-8ff2-bf06-f1a6-e7fb52779f95@infradead.org>
Date: Wed, 30 Oct 2019 21:32:10 -0700
MIME-Version: 1.0
In-Reply-To: <20191031033722.GA7687@Gentoo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: bfields@fieldses.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/30/19 8:37 PM, Bhaskar Chowdhury wrote:
> Thank you Randy, my response are inline. Please look at it.I am
> wondering , what else I could do get this damn! thing going??
> Any clue??
> 
> On 19:33 Wed 30 Oct 2019, Randy Dunlap wrote:
>> Hi,
>>
>> On 10/30/19 2:54 AM, Bhaskar Chowdhury wrote:
>>> This patch will remove old kernels and modules directorey related
>>> to that kernel from the system by interactively and silently.Here
>>> are few interactions with the scripts
>>>
>>> 1)
>>>
>>> ✔ ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>>> 14:52 $ ./scripts/prune-kernel -h
>>> Usage: prune-kernel [ri]
>>>
>>>  -r | --remove kernel_ver modules_dir_name
>>>
>>>   -i | --interactive use as interactive way
>>>   ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>>>     14:52 $ ./scripts/prune-kernel --help
>>>   Usage: prune-kernel [ri]
>>
>> That "[ri]" is confusing to me.
> This are the options one has to pass with the script.Like below:

I know that.  But it's missing '-', so it looks like
$ prune-kernel r 5.2.5-foobar

would work.

>>>
>>>    -r | --remove kernel_ver modules_dir_na]
>>>
>>>     -i | --interactive use as interactive way
>>>     2)
>>>
>>>  ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>>>  14:52 $ ./scripts/prune-kernel -r 5.3.3
>>>  You need to provide kernel version and modules dir name
>>>  
>>>  ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>>>  14:53 $ ./scripts/prune-kernel -r
>>>  You need to provide kernel version and modules dir name
>>>  
>>>  ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>>>  14:54 $ ./scripts/prune-kernel -r 5.3.3 5.3.3-foo
>>
>> This one above didn't remove any kernel files.
>> Needs more testing.
> It does remove but silently, as you and Bruce asked for this feature.

No, see the code below for -r...

>>> 3)
>>>
>>> $ ./scripts/prune-kernel --remove
>>> You need to provide kernel version and modules dir name
>>>
>>> ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>>> 14:55 $ ./scripts/prune-kernel --remove 5.3.3
>>> You need to provide kernel version and modules dir name
>>>
>>> ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>>> 14:55 $ ./scripts/prune-kernel --remove 5.3.3 5.3.3-foo
>>>
>>>
>>> 4)14:55 $ ./scripts/prune-kernel -i
>>>
>>> Enter kernel version to remove or blank/empty to exit:
>>>
>>>
>>> 5)14:57 $ ./scripts/prune-kernel --interactive
>>>
>>> Enter kernel version to remove or blank/empty to exit:
>>> ✔ ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>>>
>>>
>>> 6)14:59 $ ./scripts/prune-kernel --interactive
>>>
>>> Enter kernel version to remove or blank/empty to exit:5.3.3
>>> Please give the full modules directory name to remove:5.3.3-foo
>>>
>>>
>>>
>>> Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.
>>>
>>>
>>> 7)15:00 $ ./scripts/prune-kernel -i
>>>
>>> Enter kernel version to remove or blank/empty to exit:5.3.3
>>> Please give the full modules directory name to remove:5.3.3-foo
>>>
>>>
>>>
>>> Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.
>>>
>>>
>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> ---
>>>  scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 63 insertions(+)
>>>
>>> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
>>> index a25aa2160d47..a91010d0e2af 100755
>>> --- a/scripts/prune-kernel
>>> +++ b/scripts/prune-kernel
>>> @@ -1,3 +1,66 @@
>>>  #!/bin/bash
>>>  # SPDX-License-Identifier: GPL-2.0
>>> +#This script will delete old kernels and modules directory related to it
>>> +#-h with the script will show you the help
>>> +#-r with the script take two parameter: kernel_ver and modules_dir_name
>>> +#-i with the script allow you do the removing interactive way
>>>
>>> +flag=$1
>>> +kernel_ver=$2
>>> +modules_dir_name=$3
>>> +boot_dir=/boot
>>> +modules_dir=/lib/modules
>>> +
>>> +remove_old_kernel() {
>>> +    cd $boot_dir
>>> +    rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
>>> +    return 0
>>> +}
>>> +
>>> +remove_old_modules_dir() {
>>> +    cd $modules_dir
>>> +    rm -rf $modules_version
>>> +    return 0
>>> +}
>>> +
>>> +usage() {
>>> +    printf "Usage: $(basename $0) [ri] \n"
>>> +    printf "\n -r | --remove kernel_ver modules_dir_name \n"
>>> +    printf "\n -i | --interactive use as interactive way \n"
>>> +}
>>> +
>>> +for arg in "$@"
>>
>> what is the purpose (use) of "arg" here?
> 
> This variable is used in case statement below.

I can't find any use of 'arg' anywhere else in the script.
Please show me where it is.

>> what is the purpose of the for loop?
>>
> It scan through all the parameters pass .

What is this script supposed (expected) to do with multiple arg parameters?

>> Is any 'shift' needed to consume (or discard) the first 3 positional
>> command line arguments?
> Nope, that is not required. And I haven't use any.
>>
>>> +do
>>> +    case "$flag" in
>>> +        -i | --interactive)
>>> +            printf "\nEnter kernel version to remove or blank/empty to exit:%s"
>>> +            read kernel_version
>>> +            if [[ $kernel_version != "" ]]; then
>>> +                remove_old_kernel
>>> +                printf "Please give the full modules directory name to remove:%s"
>>> +                read modules_version
>>> +                if [[ $modules_version != "" ]]; then
>>> +                    remove_old_modules_dir
>>> +                    printf "\n\n\n Removed kernel version:$kernel_version and associated modules:$modules_version ...Done. \n"
>>
>> This message is only printed if $modules_version is non-empty.  If it is empty,
>> remove_old_kernel() has silently removed some kernel files (if they existed).
> it will fail to remove anything if the kernel_version or modules_version
> are empty and importantly exit.
>>
>>> +                else
>>> +                    exit 1
>>> +                fi
>>> +            fi
>>> +            ;;
>>> +        -h | --help)
>>> +            usage
>>> +            exit 1
>>> +            ;;
>>> +        -r | --remove)
>>> +            if [[ $# -ne 3 ]]; then
>>> +                printf "You need to provide kernel version and modules dir name\n"
>>> +                exit 1
>>> +            else
>>> +                cd $boot_dir
>>> +                rm -f $kernel_ver
>>
>> That 'rm' doesn't remove any files.  Compare what remove_old_kernel() does.
> No,it is not using that function rather take the parameter from the
> commandline and get into boot dir match with it and remove it.

But it doesn't do that.  I tested it.  It should be more like what
rmeove_old_kernel() does:

		rm -If vmlinuz-$kernel_ver System.map-$kernel_ver config-$kernel_ver

and if not, please explain why not.


>>> +                cd $modules_dir
>>> +                rm -rf $modules_dir_name
>>> +            fi
>>> +            ;;
>>> +    esac
>>> +done
>>> -- 
>>
>> The script, after this patch is applied, still contains the old script's for-loop
>> at the end of the "new" prune-kernel script.
> 
> Amazing! now it needs some explanation how I did...you probably want
> that ..here are the steps....
> 1)fetch that prune-kernel file from repos , which contains Bruce's code
> in it.
> 2) get inot it by editior, remove all except first two lines i.e bash
> interpreter and PSDX .
> 3)Save and commit it locally.
> 4) Write my own code
> 5) save it and commit it locally.
> 6) go one level up use checkpatch to see anything bad creeps in
> 7) Fixed the damn things if it reports.
> 8) create the patch
> 9) test it
> 10) Send it.
> 
> Now, how the heck , that for loop is getting staying there is a mystry
> to me!! Look like that is ruin all the work.
> irk...

I don't know.  I just know that it's not working AFAICT.

-- 
~Randy
